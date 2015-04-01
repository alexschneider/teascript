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
        @mustHaveIntegerOperands()
        @type = Type.BOOL
      when 'is', 'isnt'
        @mustHaveCompatibleOperands()
        @type = Type.BOOL
      when 'and', 'or'
        @mustHaveBooleanOperands()
        @type = Type.BOOL
      else
        # All other binary operators are arithmetic
        @mustHaveIntegerOperands()
        @type = Type.INT

  mustHaveIntegerOperands: ->
    error = "#{@op.lexeme} must have integer or float operands"
    @left.type.mustBeCompatibleWith(Type.INT, error, @op)
    @right.type.mustBeCompatibleWith(Type.INT, error, @op)

  mustHaveBooleanOperands: ->
    error = "#{@op.lexeme} must have boolean operands"
    @left.type.mustBeCompatibleWith(Type.BOOL, error, @op)
    @right.type.mustBeCompatibleWith(Type.BOOL, error, @op)

  mustHaveCompatibleOperands: ->
    error = "#{@op.lexeme} must have mutually compatible operands"
    @left.type.mustBeMutuallyCompatibleWith(@right.type, error, @op)

  optimize: ->
    #TODO

module.exports = BinaryExpression
