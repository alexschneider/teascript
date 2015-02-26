VariableDeclaration = require './entities/VariableDeclaration'
CustomError = require './custom_error'

class AnalysisContext

  constructor: (@parent) ->
    @symbolTable = {}

  @initialContext: ->
    new AnalysisContext null

  createChildContext: ->
    new AnalysisContext this

  addVariable: (name, entity) ->
    @symbolTable[name] = entity
