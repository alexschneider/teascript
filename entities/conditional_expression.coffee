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
      condition?.analyze localContext
      body.analyze localContext

  optimize: ->
    newConditions = []
    newBodies = []
    for [condition, body] in _.zip @conditions, @bodies
      if not condition?
        newBodies.push body
        continue
      condition = condition.optimize()
      continue unless condition
      body = body.optimize()
      continue unless body?
      newConditions.push condition
      newBodies.push body

    @conditions = newConditions
    @bodies = newBodies
    this

  expression: true

module.exports = ConditionalExpression
