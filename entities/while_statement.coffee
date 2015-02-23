class WhileStatement
  constructor: (@condition, @body) ->

  toString: ->
    "(While #{@condition} #{@body})"

  analyze: (context) ->
    # TODO

  optimize: ->
    # TODO

module.exports = WhileStatement
