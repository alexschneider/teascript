class BinaryExpression

  constructor: (@op, @left, @right) ->

  toString: ->
    "(#{@op.lexeme} #{@left} #{@right})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = BinaryExpression
