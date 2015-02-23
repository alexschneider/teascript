scanner = require '../scanner/scanner'
CustomError = require '../error/custom_error'

Program = require '../entities/01_program'
Block = require '../entities/02_block'
ForStatement = require '../entities/03_for_statement'
WhileStatement = require '../entities/03_while_statement'

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
  variable = match 'ID'
  match ':'
  if not at '='
    match() # TODO: match type?
  match '='
  exp = parseExpression()
  new VarDec variable, exp

parseVarAssig = ->
  variable = match 'ID'
  match '='
  exp = parseExpression()
  new VarAssig variable, exp

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
  if at 'ID'
    id = match 'ID'
    if at ':='
      parseVarDec()
    else if at '='
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
    left = new BinaryExpression(op, left, right)
  left

parseExp1 = ->
  left = parseExp2()
  while at 'and'
    op = match()
    right = parseExp2()
    left = new BinaryExpression(op, left, right)
  left

parseExp2 = ->
  left = parseExp3()
  if at ['<','<=','==','!=','>=','>']
    op = match()
    right = parseExp3()
    left = new BinaryExpression(op, left, right)
  left

parseExp3 = ->
  left = parseExp4()
  while at ['+','-']
    op = match()
    right = parseExp4()
    left = new BinaryExpression(op, left, right)
  left

parseExp4 = ->
  left = parseExp5()
  while at ['*','/']
    op = match()
    right = parseExp5()
    left = new BinaryExpression(op, left, right)
  left

parseExp5 = ->
  if at ['-','not']
    op = match()
    operand = parseExp6()
    new UnaryExpression(op, operand)
  else
    parseExp6()

parseExp6 = ->
  if at ['true','false']
    new BooleanLiteral(match().lexeme)
  else if at 'INTLIT'
    new IntegerLiteral(match().lexeme)
  else if at 'ID'
    new VariableReference(match())
  else if at '('
    match()
    expression = parseExpression()
    match ')'
    expression
  else
    error 'Illegal start of expression', tokens[0]


at = (kind, theseTokens) ->
  if tokens.length is 0
    false
  else if Array.isArray kind
    kind.some(at)
  else
    kind is tokens[0].kind

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
