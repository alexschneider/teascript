_ = require 'underscore'

class MapLiteral

  constructor: (@keys, @values) ->

  toString: ->
    '{' + _.zip(@keys, @values).map((val) ->
      "#{val[0].lexeme}: #{val[1]}"
    ).join(', ') + '}'

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = MapLiteral
