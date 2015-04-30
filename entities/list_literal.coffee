Type = require './type'

class ListLiteral

  constructor: (@elements) ->

  toString: ->
    "[#{@elements.join(', ')}]"

  analyze: (context) ->
    element.analyze(context) for element in @elements
    @type = Type.LIST

  optimize: ->
    #TODO

  expression: true

module.exports = ListLiteral
