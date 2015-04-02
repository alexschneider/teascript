Type = require './type'

class PreUnaryExpression

  constructor: (@op, @operand) ->

  toString: ->
    "(#{@op.lexeme} #{@operand})"

  analyze: (context) ->
    @operand.analyze context
    if @op.lexeme is '-'
      @mustHaveNumericOperand()
      type = Type.INT
    else if @op.lexeme is 'not'
      @mustHaveBooleanOperand()
      type = Type.BOOL

  optimize: ->
    #TODO

  # similar methods in binary expression class -- TODO: make more DRY
  mustHaveNumericOperand: ->
    error = "Unary #{@op.lexeme} must have integer or float operand"
    @operand.type.mustBeNumeric error, @op.lineNumber

  mustHaveBooleanOperand: ->
    error = "#{@op.lexeme} must have boolean operand"
    @operand.type.mustBeCompatibleWith [Type.BOOL], error, @op.lineNumber

module.exports = PreUnaryExpression
