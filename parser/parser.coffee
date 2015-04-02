CustomError = require '../error/custom_error'
ParseError = require '../error/parse_error'
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
NoneLiteral = require '../entities/none_literal'
TupleLiteral = require '../entities/tuple_literal'
PreUnaryExpression = require '../entities/pre_unary_expression'
PostUnaryExpression = require '../entities/post_unary_expression'
BinaryExpression = require '../entities/binary_expression'
Function = require '../entities/function'
FunctionInvocation = require '../entities/function_invocation'
Class = require '../entities/class'
Trait = require '../entities/trait'
Parameters = require '../entities/parameters'
Args = require '../entities/args'
Range = require '../entities/range'
OrderedIterableSubscript = require '../entities/ordered_iterable_subscript'
MemberAccess = require '../entities/member_access'
FunctionInvocation = require '../entities/function_invocation'
ReturnStatement = require '../entities/return_statement'
ConditionalExpression = require '../entities/conditional_expression'
Tokens = require '../scanner/tokens'
StartTokens = require './start_tokens'

tokens = []
errors = []

module.exports = (scannerOutput) ->
  tokens = scannerOutput
  program = parseProgram()
  match 'EOF'
  if errors.length > 0
    throw new ParseError errors
  program

parseProgram = ->
  new Program parseBlock()

parseBlock = ->
  statements = []
  while at StartTokens.statement
    statements.push parseStatement()
    match 'newline'
  if not at ['EOF', 'end', 'else']
    message = "#{tokens[0].kind} is invalid start for a statement"
    errors.push new CustomError message, tokens[0].lineNumber
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
  else if ((at '(') and areParams())
    parseFunctionExpression()
  else if at 'class'
    parseClassExpression()
  else if at 'trait'
    parseTraitExpression()
  else if at 'if'
    parseConditional()
  else
    parseVarAssig()

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

parseFunctionExpression = ->
  params = parseParams()
  match '->'
  if at 'newline'
    match 'newline'
    body = parseBlock()
    match 'end'
  else
    body = parseExpression()
  new Function params, body

parseClassExpression = ->
  match 'class'
  match ':'
  match 'newline'
  expressions = []
  while not at 'end'
    expressions.push parseExpression()
    match 'newline'
  match 'end'
  new Class expressions


parseTraitExpression = ->
  match 'trait'
  match ':'
  match 'newline'
  expressions = []
  while not at 'end'
    expressions.push parseExpression()
    match 'newline'
  match 'end'
  new Trait expressions


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
  new WhileStatement condition, body

parseVarDec = ->
  typeOfDec = 'Var'
  id = match 'ID'
  match ':='
  exp = parseExpression()
  new VariableDeclaration id, exp

parseVarAssig = ->
  left = parseTernExp()
  while((at ['=']))
    op = match()
    left = new VariableAssignment left, parseExpression()
  left

parseConditionalBody = ->
  if at 'newline'
    match()
    block = parseBlock()
    if at ['else', 'end']
      match()
    else
      match 'end'
    block
  else if at 'return'
    parseReturnStatement()
  else
    parseExpression()

parseConditional = ->
  conditions = []
  bodies = []
  while at 'if'
    match()
    conditions.push parseExp0()
    match ':'
    bodies.push parseConditionalBody()
    continue if at 'if'
    break unless at ':'
    match()
    bodies.push parseConditionalBody()
    break
  new ConditionalExpression conditions, bodies

parseTernExp = ->
  val = parseExp0()
  if at 'if'
    match()
    bodies = [val]
    conditions = [parseExp0()]
    if at 'else'
      match()
      bodies.push parseExp0()
    new ConditionalExpression conditions, bodies
  else
    val

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
  if ((at '..') or (at '...'))
    op = match()
    right = parseExp4()
    if at 'by'
      # include skip factor in range
      match()
      left = new Range op, left, right, parseExp4()
    else
      left = new Range op, left, right
  left

parseExp4 = ->
  left = parseExp5()
  while ((at ['+', '-']) and
  (next StartTokens.expression))
    op = match()
    right = parseExp5()
    left = new BinaryExpression op, left, right
  left

parseExp5 = ->
  left = parseExp6()
  while ((at ['*', '/', '%']) and
  (next StartTokens.expression))
    op = match()
    right = parseExp6()
    left = new BinaryExpression op, left, right
  left

parseExp6 = ->
  if ((at ['-', 'not']) and
  (next StartTokens.expression))
    op = match()
    operand = parseExp7()
    new PreUnaryExpression op, operand
  else
    parseExp7()

parseExp7 = ->
  left = parseExp8()
  if((at ['**']) and (next StartTokens.expression))
    op = match()
    left = new BinaryExpression op, left, parseExp5()
  left

parseExp8 = ->
  exp = parseExp9()
  while (at ['.', '[', '('])
    if at '.'
      match '.'
      exp = new MemberAccess exp, parseExp3()
    else if at '['
      match '['
      exp = new OrderedIterableSubscript exp, parseExp3()
      match ']'
    else
      exp = new FunctionInvocation exp, parseArgs()
  exp

parseExp9 = ->
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
  else if at 'ID'
    new VariableReference match()
  else if at '['
    parseListLiteral()
  else if at '<'
    parseSetLiteral()
  else if at '|'
    parseTupleLiteral()
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
    match 'newline' if at 'newline'
    match ',' unless at ']'

  match 'newline' if at 'newline'
  match ']'
  new ListLiteral elements

parseSetLiteral = ->
  elements = []
  match '<'

  while not at '>'
    match 'newline' if at 'newline'
    elements.push parseExpression()
    match 'newline' if at 'newline'
    match ',' unless at '>'

  match 'newline' if at 'newline'
  match '>'
  new SetLiteral elements

parseTupleLiteral = ->
  elements = []
  match '|'

  while not at '|'
    match 'newline' if at 'newline'
    elements.push parseExpression()
    match 'newline' if at 'newline'
    match ',' unless at '|'

  match 'newline' if at 'newline'
  match '|'
  new TupleLiteral elements


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
    match 'newline' if at 'newline'
    match ',' unless at '}'

  match 'newline' if at 'newline'
  match '}'
  new MapLiteral keys, values

at = (kind, theseTokens) ->
  unless Array.isArray theseTokens
    theseTokens = (if @tokens then @tokens else tokens)

  if theseTokens.length is 0
    false
  else if Array.isArray kind
    # search recursively to see if any of the
    # kinds within the provided array match
    # the kind we are looking for
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

areParams = ->
  parens = 0
  position = 0
  for token in tokens
    parens++ if token.kind is '('
    parens-- if token.kind is ')'
    position++
    break if parens is 0
  tokens[position].kind is '->'

match = (kind) ->
  if tokens.length <= 0
    errors.push new CustomError 'Unexpected end of program', 0
  else if kind is undefined or kind is tokens[0].kind
    tokens.shift()
  else
    badToken = tokens.shift()
    errors.push new CustomError "Expected #{kind}, found #{badToken.kind}",
                badToken.lineNumber
