class FunctionInvocation

  constructor: (@func, @args) ->

  toString: ->
    "(Invoke #{@func} #{@args})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = FunctionInvocation
