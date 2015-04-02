class Args

  constructor: (@args) ->

  toString: ->
    "(#{@args.join(', ')})"

  analyze: (context) ->
    arg.analyze context for arg in @args

  optimize: -> this

module.exports = Args