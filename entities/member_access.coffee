class MemberAccess

  constructor: (@object, @member) ->

  toString: ->
    "(. #{@object} #{@member})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = MemberAccess
