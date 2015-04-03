CustomError = require '../error/custom_error'
VariableDeclaration = require '../entities/variable_declaration'

class AnalysisContext

  constructor: (@parent) ->
    @symbolTable = {}

  @initialContext: ->
    new AnalysisContext null

  createChildContext: ->
    new AnalysisContext this

  variableMustNotBeAlreadyDeclared: (token, error) ->
    error ?= "Variable #{token.lexeme} already declared"
    if @symbolTable[token.lexeme]
      throw new CustomError error, token.lineNumber

  addVariable: (name, entity) ->
    @symbolTable[name] = entity

  lookupVariable: (token) ->
    variable = @symbolTable[token.lexeme]
    if variable
      variable
    else if not @parent
      throw new CustomError "Variable #{token.lexeme} not found",
                            token.lineNumber
      VariableDeclaration.ARBITRARY
    else
      @parent.lookupVariable token

exports.initialContext = AnalysisContext.initialContext