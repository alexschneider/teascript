class Args

  constructor: (@args) ->

  toString: ->
    "(#{@args.join(', ')})"

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = Args