class VariableDeclaration

  constructor: (@id, @value) ->

  toString: ->
    "(VarDec (#{@id.lexeme} #{@value}))"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = VariableDeclaration
