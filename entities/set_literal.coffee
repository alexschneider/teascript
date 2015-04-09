Type = require './type'

class SetLiteral

  constructor: (@members) ->

  toString: ->
    "<#{@members.join(', ')}>"

  analyze: (context) ->
    member.analyze(context) for member in @members
    @type = Type.SET

  optimize: ->
    #TODO

module.exports = SetLiteral
