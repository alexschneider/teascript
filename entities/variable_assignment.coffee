Type = require './type'
CustomError = require '../error/custom_error'


class AssignmentStatement

  constructor: (@target, @source) ->

  toString: ->
    "(= #{@target} #{@source})"

  analyze: (context) ->
    @target.analyze context
    @source.analyze context
    @checkForNestedAssignment()
    console.log @target
    console.log "Source " + @source

    @type = @source.type


  checkForNestedAssignment: ->
    if @source instanceof AssignmentStatement
      throw new CustomError 'Nested variable declarations not allowed',
                            @target.token.lineNumber

  optimize: ->
    #TODO

module.exports = AssignmentStatement
