_ = require 'underscore'
Type = require './type'

class MapLiteral

  constructor: (@keys, @values) ->

  toString: ->
    '{' + _.zip(@keys, @values).map((val) ->
      "#{val[0].lexeme}: #{val[1]}"
    ).join(', ') + '}'

  analyze: (context) ->
    value.analyze(context) for value in @values
    @type = Type.MAP

  optimize: ->
    #TODO

  

module.exports = MapLiteral
