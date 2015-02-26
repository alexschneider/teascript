class VariableDeclaration

  constructor: (@type, @id, @value) ->

  toString: ->
    "(#{@type}Dec (#{@id.lexeme} #{@value}))"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = VariableDeclaration
