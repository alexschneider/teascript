initialContext = require('../analyzer/analyzer').initialContext

class Program
  constructor: (@block) ->

  toString: ->
    "(Program #{@block})"

  analyze: ->
    @block.analyze initialContext()

  optimize: ->
    @block = @block.optimize()
    this

  showSemanticGraph: ->
    # TODO

module.exports = Program
