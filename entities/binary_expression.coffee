Type = require './type'

class BinaryExpression

  constructor: (@op, @left, @right) ->

  toString: ->
    "(#{@op.lexeme} #{@left} #{@right})"

  analyze: (context) ->
    @left.analyze context
    @right.analyze context
    op = @op.lexeme
    switch op
      when '<', '<=', '>=', '>'
        @mustHaveNumericOperands()
        @type = Type.BOOL
      when 'is', 'isnt'
        @mustHaveCompatibleOperands()
        @type = Type.BOOL
      when 'and', 'or'
        @mustHaveBooleanOperands()
        @type = Type.BOOL
      else
        # All other binary operators are arithmetic
        @mustHaveNumericOperands()
        @type = @getNumericType()

  getNumericType: ->
    if @left.type is Type.FLOAT or @right.type is Type.FLOAT
      # if either opperand in the arithmetic expression is
      # a float, then the expression evaluates to a float
      return Type.FLOAT
    else
      # otherwise, the arithmetic expression evaluates to an int
      return Type.INT

  mustHaveNumericOperands: ->
    error = "#{@op.lexeme} must have integer or float operands
             (found #{@left.type} and #{@right.type})"
    @left.type.mustBeNumeric error, @op.lineNumber
    @right.type.mustBeNumeric error, @op.lineNumber

  mustHaveBooleanOperands: ->
    error = "#{@op.lexeme} must have boolean operands"
    @left.type.mustBeCompatibleWith [Type.BOOL], error, @op.lineNumber
    @right.type.mustBeCompatibleWith [Type.BOOL], error, @op.lineNumber

  mustHaveCompatibleOperands: ->
    error = "#{@op.lexeme} must have mutually compatible operands"
    @left.type.mustBeMutuallyCompatibleWith @right.type, error, @op.lineNumber

  optimize: ->
    #TODO

  expression: true

module.exports = BinaryExpression
