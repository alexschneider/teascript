_ = require 'underscore'

class ConditionalExpression
  constructor: (@conditions, @bodies) ->

  toString: ->
    sb = []
    for [condition, body] in _.zip @conditions, @bodies
      if condition?
        sb.push "if #{condition} #{body} else"
      else
        sb.push body
    "(#{sb.join ' '})"

  analyze: (context) ->
    # TODO

  optimize: ->
    # TODO

module.exports = ConditionalExpression
