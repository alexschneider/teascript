class MapLiteral

  constructor: (@keys, @values) ->
    console.log "constructing a map literal"

  toString: ->
    console.log "to string a map literal"
    resultString = []
    for i in [0...@keys.length]
      resultString.push "#{@keys[i].lexeme}: #{@values[i]}"
    "{#{resultString.join(', ')}}"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = MapLiteral
