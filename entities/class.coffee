_ = require 'underscore'

class Class
  constructor: (@fieldNames, @fieldValues) ->

  toString: ->
    classes = _.zip(@fieldNames, @fieldValues).map (val) ->
      "(#{val[0].lexeme}: #{val[1]})"
    "(Class #{classes.join ', '})"

  analyze: (context) ->
    # TODO

  optimize: (context) ->
    # TODO

module.exports = Class
