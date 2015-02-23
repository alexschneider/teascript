scanner = require '../scanner/scanner'
CustomError = require '../error/custom_error'

Program = require '../entities/program'
Block = require '../entities/block'
ForStatement = require '../entities/for_statement'
WhileStatement = require '../entities/while_statement'
IntegerLiteral = require '../entities/integer_literal'
FloatLiteral = require '../entities/float_literal'
StringLiteral = require '../entities/string_literal'
BooleanLiteral = require '../entities/boolean_literal'
VariableReference = require '../entities/variable_reference'
VariableDeclaration = require '../entities/variable_declaration'
VariableAssignment = require '../entities/variable_assignment'
ListLiteral = require '../entities/list_literal'
SetLiteral = require '../entities/set_literal'
MapLiteral = require '../entities/map_literal'
UnaryExpression = require '../entities/unary_expression'
BinaryExpression = require '../entities/binary_expression'
Tokens = require '../scanner/tokens'
StartTokens = require './start_tokens'

tokens = []

module.exports = (scannerOutput) ->
  tokens = scannerOutput
  program = parseProgram()
  match 'EOF'
  program

parseProgram = ->
  new Program parseBlock()

parseBlock = ->
  statements = []
  loop
    statements.push parseStatement()
    while at 'newline'
      match 'newline'
    break unless at StartTokens.statement
  new Block statements

parseStatement = ->
  if at 'for'
    parseForLoop()
  else if at 'while'
    parseWhileLoop()
  else
    parseExpression()

parseForLoop = ->
  match 'for'
  id = match 'ID'
  match 'in'
  iterable = parseExpression()
  match ':'
  if at 'newline'
    body = parseBlock()
    match 'end'
  else
    body = parseExpression()
    match 'newline'
  new ForStatement id, iterable, body

parseWhileLoop = ->
  match 'while'
  condition = parseExpression()
  match ':'
  if at 'newline'
    body = parseBlock()
    match 'end'
  else
    body = parseExpression()
    match 'newline'
  new WhileStatement condition, body

parseVarDec = ->
  id = match 'ID'
  match ':='
  # TODO: match type?
  exp = parseExpression()
  new VariableDeclaration id, exp

parseVarAssig = ->
  id = match 'ID'
  match '='
  exp = parseExpression()
  new VariableAssignment id, exp

parseConditional = ->
  if at 'if'
    match()
    condition = parseExpression()
    match ':'
  else
    ifExp = parseExpression()
    match 'if'
    condition = parseExpression()
    if at 'else'
      match()
      elseExp = parseExpression()

parseExpression = ->
  if next ':='
    parseVarDec()
  else if next '='
    parseVarAssig()
  else if at 'if'
    parseConditional()
  else if at 'class'
    parseClassDec()
  else
    parseExp0()


parseExp0 = ->
  left = parseExp1()
  while at 'or'
    op = match()
    right = parseExp1()
    left = new BinaryExpression op, left, right
  left

parseExp1 = ->
  left = parseExp2()
  while at 'and'
    op = match()
    right = parseExp2()
    left = new BinaryExpression op, left, right
  left

parseExp2 = ->
  left = parseExp3()

  if ((at ['<', '<=', '>=', '>', 'is', 'isnt']) and
  (next StartTokens.expression))
    op = match()
    right = parseExp3()
    left = new BinaryExpression op, left, right
  left

parseExp3 = ->
  left = parseExp4()
  while at ['+', '-']
    op = match()
    right = parseExp4()
    left = new BinaryExpression op, left, right
  left

parseExp4 = ->
  left = parseExp5()
  while at ['*', '/', '%']
    op = match()
    right = parseExp5()
    left = new BinaryExpression op, left, right
  left

parseExp5 = ->
  if at ['-', 'not']
    op = match()
    operand = parseExp6()
    new UnaryExpression op, operand
  else
    parseExp6()

parseListLiteral = ->
  elements = []
  match '['

  while not at ']'
    match 'newline' if at 'newline'
    elements.push parseExpression()
    match ',' if at ','
    match 'newline' if at 'newline'

  match 'newline' if at 'newline'
  match ']'
  new ListLiteral elements

parseSetLiteral = ->
  elements = []
  match '<'
  while not at '>'
    match 'newline' if at 'newline'
    elements.push parseExpression()
    match ',' if at ','
    match 'newline' if at 'newline'

  match 'newline' if at 'newline'
  match '>'
  new SetLiteral elements

parseMapLiteral = ->
  keys = []
  values = []
  match '{'
  while not at '}'
    match 'newline' if at 'newline'
    key = match 'ID'
    keys.push key
    match ':'
    value = parseExpression()
    values.push value
    match ',' if at ','
    match 'newline' if at 'newline'

  match 'newline' if at 'newline'
  match '}'
  new MapLiteral keys, values

parseExp6 = ->
  if at ['true', 'false']
    new BooleanLiteral match().lexeme
  else if at 'INTLIT'
    new IntegerLiteral match().lexeme
  else if at 'FLOATLIT'
    new FloatLiteral match().lexeme
  else if at 'STRLIT'
    new StringLiteral match().lexeme
  else if at ['ID', Tokens.reservedWords]
    new VariableReference match()
  else if at '['
    parseListLiteral()
  else if at '<'
    parseSetLiteral()
  else if at '{'
    parseMapLiteral()
  else if at '('
    # TODO handle parsing tuples or parsing
    # expressions here - operator overloads
    match()
    expression = parseExpression()
    match ')'
    expression
  else
    CustomError 'Illegal start of expression', tokens[0]


at = (kind, theseTokens) ->
  unless Array.isArray(theseTokens)
    theseTokens = (if @tokens then @tokens else tokens)

  if theseTokens.length is 0
    false
  else if Array.isArray kind
    kind.some(at, {tokens: theseTokens})
  else
    kind is theseTokens[0].kind

next = (kind) ->
  at kind, tokens[1..]


match = (kind) ->
  if tokens.length is 0
    CustomError 'Unexpected end of program', 0
  else if kind is undefined or kind is tokens[0].kind
    tokens.shift()
  else
    CustomError "Expected #{kind}, found #{tokens[0].kind}",
                tokens[0].lineNumber
