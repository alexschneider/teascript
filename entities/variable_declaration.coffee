class VariableDeclaration

  constructor: (@id, @value) ->

  toString: ->
    "(VarDec (#{@id.lexeme} #{@value.value}))"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = VariableDeclaration
