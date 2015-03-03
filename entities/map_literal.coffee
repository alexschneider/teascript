class MapLiteral

  constructor: (@keys, @values) ->

  toString: ->
    resultString = []
    for i in [0...@keys.length]
      resultString.push "#{@keys[i].lexeme}: #{@values[i]}"
    "{#{resultString.join(', ')}}"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = MapLiteral
