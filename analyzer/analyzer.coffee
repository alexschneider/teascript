error = require '../error/custom_error'
VariableDeclaration = require '../entities/variable_declaration'

class AnalysisContext

  constructor: (@parent) ->
    @symbolTable = {}

  @initialContext: ->
    new AnalysisContext null

  createChildContext: ->
    new AnalysisContext @

  variableMustNotBeAlreadyDeclared: (token) ->
    if @symbolTable[token.lexeme]
      error "Variable #{token.lexeme} already declared", token

  addVariable: (name, entity) ->
    @symbolTable[name] = entity

  lookupVariable: (token) ->
    variable = @symbolTable[token.lexeme]
    if variable
      variable
    else if not @parent
      error "Variable #{token.lexeme} not found", token
      VariableDeclaration.ARBITRARY
    else
      @parent.lookupVariable token

exports.initialContext = AnalysisContext.initialContext