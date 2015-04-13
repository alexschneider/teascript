class Args

  constructor: (@args) ->

  toString: ->
    "(#{@args.join(', ')})"

  analyze: (context) ->
    arg.analyze context for arg in @args

  optimize: ->
    #TODO

module.exports = Args