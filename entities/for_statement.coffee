class ForStatement
  constructor: (@id, @iterable, @body) ->

  toString: ->
    "(For #{@id.lexeme} #{@body})"

  analyze: (context) ->
    # TODO

  optimize: ->
    # TODO

module.exports = ForStatement
