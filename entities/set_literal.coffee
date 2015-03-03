class SetLiteral

  constructor: (@members) ->

  toString: ->
    "<#{@members.join(', ')}>"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = SetLiteral
