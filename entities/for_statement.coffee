class ForStatement
  constructor: (@id, @iterable, @body) ->

  toString: ->
    "(For #{@id.lexeme} #{@iterable} #{@body})"

  analyze: (context) ->
    # TODO
    # id is matched in parser
    # iterable must match ordered or unordered iterable

  optimize: ->
    # TODO

module.exports = ForStatement
