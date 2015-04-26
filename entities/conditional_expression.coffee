_ = require 'underscore'

class ConditionalExpression
  constructor: (@conditions, @bodies) ->

  toString: ->
    sb = []
    sb.push "if #{@conditions[0]} #{@bodies[0]}"
    for [condition, body] in _.zip @conditions[1..], @bodies[1..]
      if condition?
        sb.push "else if #{condition} #{body}"
      else
        sb.push "else #{body}"
    "(#{sb.join ' '})"

  analyze: (context) ->
    for [condition, body] in _.zip @conditions, @bodies
      localContext = context.createChildContext()
      condition.analyze localContext if condition?
      body.analyze localContext

  optimize: ->
    # TODO

  expression: true

module.exports = ConditionalExpression
