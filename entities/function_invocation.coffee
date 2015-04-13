EntityUtils = require './entity_utilities'
Type = require './type'

class FunctionInvocation

  constructor: (@func, @args) ->

  toString: ->
    "(Invoke #{@func} #{@args})"

  analyze: (context) ->
    functionLocation = EntityUtils.findLocation @func
    @func.analyze context
    @args.analyze context

    @mustBeFunction functionLocation



  mustBeFunction: (functionLocation) ->
    error = "#{@func.type} is not callable"
    @func.type.mustBeCompatibleWith [Type.FUNC],
                                    error,
                                    functionLocation


  optimize: ->
    #TODO

module.exports = FunctionInvocation
