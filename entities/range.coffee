class Range
  constructor: (@op, @num1, @num2, @skip) ->

  toString: ->
    "(#{@num1}#{@op.lexeme}#{@num2} by #{@skip or 1})"

  analyze: (context) ->
    @num1.analyze context
    @num2.analyze context
    @skip.analyze context if @skip?
    @mustHaveIntegerOperands()

  mustHaveIntegerOperands: ->
    error = ".. and ... range operators must have all integer operands"
    @num1.type.mustBeInteger(error, @op.lineNumber)
    @num2.type.mustBeInteger(error, @op.lineNumber)
    @skip.type.mustBeInteger(error, @op.lineNumber) if @skip?

  optimize: ->
    #TODO

module.exports = Range
