class AssignmentStatement

  constructor: (@target, @source) ->

  toString: ->
    "(= #{@target.lexeme} #{@source})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = AssignmentStatement
