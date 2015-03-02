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
PreUnaryExpression = require '../entities/pre_unary_expression'
PostUnaryExpression = require '../entities/post_unary_expression'
BinaryExpression = require '../entities/binary_expression'
Function = require '../entities/function'
FunctionInvocation = require '../entities/function_invocation'
Parameters = require '../entities/parameters'
Args = require '../entities/args'
ListSubscript = require '../entities/list_subscript'
MemberAccess = require '../entities/member_access'
NoneLiteral = require '../entities/none_literal'
FunctionInvocation = require '../entities/function_invocation'
ReturnStatement = require '../entities/return_statement'
Tokens = require '../scanner/tokens'
StartTokens = require './start_tokens'

tokens = []
error = null

module.exports = (scannerOutput) ->
  tokens = scannerOutput
  program = parseProgram()
  match 'EOF'
  return {error} if error?
  return {error, program}

parseProgram = ->
  new Program parseBlock()

parseBlock = ->
  statements = []
  loop
    statements.push parseStatement()
    match 'newline' if at 'newline'
    break unless ((at StartTokens.statement) and
                   not (at 'end'))
  new Block statements

parseStatement = ->
  if at 'for'
    parseForLoop()
  else if at 'while'
    parseWhileLoop()
  else if at 'return'
    parseReturnStatement()
  else
    parseExpression()

parseExpression = ->
  if next ':='
    parseVarDec()
  else if next '='
    parseVarAssig()
  else if at 'if'
    parseConditional()
  else
    parseExp0()

parseReturnStatement = ->
  match 'return'
  new ReturnStatement parseExpression()

parseParams = ->
  match '('
  params = []
  while not at ')'
    params.push parseExpression()
    match ',' if at ','
  match ')'
  new Parameters params

parseArgs = ->
  match '('
  args = []
  while not at ')'
    args.push parseExpression()
    match ',' if at ','
  match ')'
  new Args args

parseFunction = ->
  params = parseParams()
  match '->'
  match 'newline'
  body = parseBlock()
  new Function params, body

parseForLoop = ->
  match 'for'
  id = match 'ID'
  match 'in'
  iterable = parseExpression()
  match ':'
  if at 'newline'
    match 'newline'
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
    match 'newline'
    body = parseBlock()
    match 'end'
  else
    body = parseExpression()
    match 'newline'
  new WhileStatement condition, body

parseVarDec = ->
  typeOfDec = 'Var'
  id = match 'ID'
  match ':='
  if inStatement '->'
    typeOfDec = 'Func'
    exp = parseFunction()
  else
    exp = parseExpression()
  new VariableDeclaration typeOfDec, id, exp

parseVarAssig = ->
  id = match 'ID'
  match '='
  exp = parseExpression()
  new VariableAssignment id, exp

parseConditional = ->
  # TODO
  # if at 'if'
  #   match()
  #   condition = parseExpression()
  #   match ':'
  # else
  #   ifExp = parseExpression()
  #   match 'if'
  #   condition = parseExpression()
  #   if at 'else'
  #     match()
  #     elseExp = parseExpression()


parseExp0 = ->
  left = parseExp1()
  while ((at 'or') and
  (next StartTokens.expression))
    op = match()
    right = parseExp1()
    left = new BinaryExpression op, left, right
  left

parseExp1 = ->
  left = parseExp2()
  while ((at 'and') and
  (next StartTokens.expression))
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
  while ((at ['+', '-']) and
  (next StartTokens.expression))
    op = match()
    right = parseExp4()
    left = new BinaryExpression op, left, right
  left

parseExp4 = ->
  left = parseExp5()
  while ((at ['*', '/', '%']) and
  (next StartTokens.expression))
    op = match()
    right = parseExp5()
    left = new BinaryExpression op, left, right
  left

parseExp5 = ->
  if ((at ['-', 'not']) and
  (next StartTokens.expression))
    op = match()
    operand = parseExp6()
    new PreUnaryExpression op, operand
  else
    parseExp6()


parseExp6 = ->
  exp = left = parseExp7()
  if((at ['**']) and (next StartTokens.expression))
    op = match()
    right = parseExp5()
    if((at ['**']) and (next StartTokens.expression))
      op = match()
      right = new BinaryExpression op, right, parseExp5()
    exp = new BinaryExpression op, left, right  
  exp

parseExp7 = ->
  exp = parseExp8()

  while (at ['.', '[', '('])
    if at '.'
      match '.'
      exp = new MemberAccess exp, parseExpression()
    else if at '['
      match '['
      exp = new ListSubscript exp, parseExpression()
      match ']'
    else
      exp = new FunctionInvocation exp, parseArgs()

  if at([ '++', '--' ])
    op = match()
    exp = new PostUnaryExpression op, exp
  exp

parseExp8 = ->
  if at ['true', 'false']
    new BooleanLiteral match()
  else if at 'none'
    new NoneLiteral match()
  else if at 'INTLIT'
    new IntegerLiteral match()
  else if at 'FLOATLIT'
    new FloatLiteral match()
  else if at 'STRLIT'
    new StringLiteral match()
  else if at ['ID', Tokens.reservedWords]
    new VariableReference match()
  else if at '['
    parseListLiteral()
  else if at '<'
    parseSetLiteral()
  else if at '{'
    parseMapLiteral()
  else if at '('
    match()
    expression = parseExpression()
    match ')'
    expression
  else
    CustomError 'Illegal start of expression', tokens[0]

parseListLiteral = ->
  elements = []
  match '['

  while not at ']'
    match 'newline' if at 'newline'
    elements.push parseExpression()
    match ',' if at ','
    match 'newline' if at 'newline'

  match ']'
  new ListLiteral elements

parseSetLiteral = ->
  elements = []
  match '<'

  while not (at '>')
    match 'newline' if at 'newline'
    elements.push parseExpression()
    match ',' if at ','
    match 'newline' if at 'newline'

  match '>'
  new SetLiteral elements

parseMapLiteral = ->
  keys = []
  values = []
  match '{'

  while not (at '}')
    match 'newline' if at 'newline'
    key = match 'ID'
    keys.push key
    match ':'
    value = parseExpression()
    values.push value
    match ',' if at ','
    match 'newline' if at 'newline'

  match '}'
  new MapLiteral keys, values


at = (kind, theseTokens) ->
  unless Array.isArray theseTokens
    theseTokens = (if @tokens then @tokens else tokens)

  if theseTokens.length is 0
    false
  else if Array.isArray kind
    kind.some(at, {tokens: theseTokens})
  else
    kind is theseTokens[0].kind

next = (kind) ->
  at kind, tokens[1..]

findIndexOfNext = (kind) ->
  i = 0
  for token in tokens
    return i if token.kind is kind
    i++

inStatement = (kind) ->
  endingPosOfCurrentStatement = findIndexOfNext 'newline'
  currentStatement = tokens[..endingPosOfCurrentStatement]
  if tokens.length is 0
    false
  else if Array.isArray kind
    kind.some at
  else
    kind in (token.kind for token in currentStatement)

match = (kind) ->
  if tokens.length is 0
    error = new CustomError 'Unexpected end of program', 0
  else if kind is undefined or kind is tokens[0].kind
    tokens.shift()
  else
    error = new CustomError "Expected #{kind}, found #{tokens[0].kind}",
                tokens[0].lineNumber
