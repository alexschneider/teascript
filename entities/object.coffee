class Object

  constructor: (@className, @args) ->

  toString: ->
    "(Object #{@className.lexeme} (#{(arg.lexeme for arg in @args).join(', ')}))"

  analyze: (context, className) ->
    #TODO. type = Type.forName className

  optimize: (context) ->
    # TODO

module.exports = Object
