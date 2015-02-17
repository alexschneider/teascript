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

parseProgram = ->
  new Program parseBlock

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
  id = parseId()
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

parseExpression = ->
  # TODO

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
  ### TODO: finish
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
  ###


at = (kind, theseTokens) ->
  theseTokens ?= tokens
  if theseTokens.length is 0
    false
  else if Array.isArray kind
    kind.some at
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
