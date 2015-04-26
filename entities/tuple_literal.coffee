Type = require './type'

class TupleLiteral

  constructor: (@elements) ->

  toString: ->
    "|#{@elements.join(', ')}|"

  analyze: (context) ->
    element.analyze(context) for element in @elements
    @type = Type.TUPLE

  optimize: ->
    #TODO

  expression: true

module.exports = TupleLiteral
