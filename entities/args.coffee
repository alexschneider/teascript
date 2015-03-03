class Args

  constructor: (@args) ->

  toString: ->
    "(#{@args.join(', ')})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = Args