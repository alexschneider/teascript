class Range
  constructor: (@op, @num1, @num2, @skip = 1) ->

  toString: ->
    "(#{@num1}#{@op.lexeme}#{@num2} by #{@skip})"

  analyze: (context) ->
    # TODO

  optimize: ->
    # TODO

module.exports = Range
