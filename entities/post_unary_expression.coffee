class PostUnaryExpression

  constructor: (@op, @operand) ->

  toString: ->
    "(#{@operand} #{@op.lexeme})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = PostUnaryExpression
