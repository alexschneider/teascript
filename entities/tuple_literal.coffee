Type = require './type'

class TupleLiteral

  constructor: (@elements) ->

  toString: ->
    "|#{@elements.join(', ')}|"

  analyze: (context) ->
    element.analyze(context) for element in @elements
    @type = Type.TUPLE

  length: ->
    @elements.length

  optimize: ->
    #TODO

module.exports = TupleLiteral
