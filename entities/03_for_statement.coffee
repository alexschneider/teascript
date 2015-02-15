class ForStatement
  constructor: (@id, @iterable, @body) ->

  toString: ->
    "(For #{@id} #{@iterable} #{@body})"

  analyze: (context) ->
    # TODO

  optimize: ->
    # TODO

module.exports = ForStatement
