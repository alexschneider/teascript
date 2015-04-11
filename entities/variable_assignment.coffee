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
    @checkForTypeCompatability @target, @source

    @type = @source.type


  checkForNestedAssignment: ->
    if @source instanceof AssignmentStatement
      throw new CustomError 'Nested variable declarations not allowed',
                            @target.token.lineNumber

  checkForTypeCompatability: (@target, @source) ->
    if @source.type isnt @target.type
      throw new CustomError 'Incompatible types',
                            @target.token.lineNumber

  optimize: ->
    #TODO

module.exports = AssignmentStatement
