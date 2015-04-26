Type = require './type'

class Object

  constructor: (@className, @args) ->

  toString: ->
    "(Object #{@className.lexeme} (#{(arg.lexeme for arg in @args).join(', ')}))"

  analyze: (context, className) ->
    arg.analyze context for arg in @args
    @type = Type.forName @className.lexeme

  optimize: (context) ->
    # TODO

  expression: true

module.exports = Object
