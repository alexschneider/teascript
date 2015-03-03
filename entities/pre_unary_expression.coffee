class PreUnaryExpression

  constructor: (@op, @operand) ->

  toString: ->
    "(#{@op.lexeme} #{@operand})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = PreUnaryExpression
