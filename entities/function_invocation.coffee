class FunctionInvocation

  constructor: (@func, @args) ->

  toString: ->
    "(Invoke #{@func} #{@args.join(', ')}"


  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = FunctionInvocation
