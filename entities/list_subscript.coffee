class ListSubscript

  constructor: (@list, @index) ->

  toString: ->
    "(Subscript #{@list} #{@index})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = ListSubscript
