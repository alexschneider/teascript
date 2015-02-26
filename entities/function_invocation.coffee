class FunctionInvocation

  constructor: (@func, @args) ->

  toString: ->
    "(Invoke #{@func} #{@args})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = FunctionInvocation
