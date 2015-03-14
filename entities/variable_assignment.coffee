class AssignmentStatement

  constructor: (@target, @source) ->

  toString: ->
    "(= #{@target} #{@source})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = AssignmentStatement
