class VariableDeclaration

  constructor: (@id, @value, @type) ->

  toString: ->
    "(#{@type}Dec (#{@id.lexeme} #{@value}))"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = VariableDeclaration
