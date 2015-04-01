class Args

  constructor: (@args) ->

  toString: ->
    "(#{@args.join(', ')})"

  analyze: (context) ->

  optimize: -> this

module.exports = Args