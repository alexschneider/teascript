Type = require './type'
generate = require '../generators/jsgenerator'

class Range
  constructor: (@op, @num1, @num2, @skip) ->

  toString: ->
    "(#{@num1}#{@op.lexeme}#{@num2} by #{@skip or 1})"

  analyze: (context) ->
    @num1.analyze context
    @num2.analyze context
    @skip.analyze context if @skip?
    @type = Type.LIST
    @mustHaveIntegerOperands()

  mustHaveIntegerOperands: ->
    error = '.. and ... range operators must have all integer operands'
    @num1.type.mustBeInteger(error, @op.lineNumber)
    @num2.type.mustBeInteger(error, @op.lineNumber)
    @skip.type.mustBeInteger(error, @op.lineNumber) if @skip?

  length: ->
    lb = +@num1.lexeme.value
    ub = if @op.lexeme is '...' then +@num2.lexeme.value else +@num2.lexeme.value - 1
    skip = if @skip then +@skip else 1
    console.log 'lb is ' + lb + ' and ub is ' + ub + ' and skip is ' + skip
    console.log Math.floor (ub - lb + 1) / skip
    Math.floor (ub - lb + 1) / skip

  optimize: ->
    @length()

  

module.exports = Range
