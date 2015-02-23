class UnaryExpression

  constructor: (@op, @operand) ->

  toString: ->
    "(#{@op.lexeme} #{@operand})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = UnaryExpression
