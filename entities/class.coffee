_ = require 'underscore'

class Class
  constructor: (@fieldNames, @fieldValues) ->

  toString: ->
    "(Class #{_.zip(@fieldNames, @fieldValues).map((val) ->
      "(#{val[0].lexeme}: #{val[1]})"
    ).join(', ')})"

  analyze: (context) ->
    # TODO

  optimize: (context) ->
    # TODO

module.exports = Class
