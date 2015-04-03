class MemberAccess

  constructor: (@object, @member) ->

  toString: ->
    "(. #{@object} #{@member})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = MemberAccess
