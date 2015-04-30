Type = require './type'

class PreUnaryExpression

  constructor: (@op, @operand) ->

  toString: ->
    "(#{@op.lexeme} #{@operand})"

  analyze: (context) ->
    @operand.analyze context
    if @op.lexeme is '-'
      @mustHaveNumericOperand()
      @type = @operand.type
    else if @op.lexeme is 'not'
      @mustHaveBooleanOperand()
      @type = Type.BOOL

  optimize: ->
    #TODO

  mustHaveNumericOperand: ->
    error = "Unary #{@op.lexeme} must have integer or float operand"
    @operand.type.mustBeNumeric error, @op.lineNumber

  mustHaveBooleanOperand: ->
    error = "#{@op.lexeme} must have boolean operand"
    @operand.type.mustBeCompatibleWith [Type.BOOL], error, @op.lineNumber

  expression: true

module.exports = PreUnaryExpression
