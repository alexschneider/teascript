class Block
  constructor: (@statements) ->

  toString: ->
    "(Block #{@statements.join(' ')})"

  analyze: (context) ->
    console.log "analyzing a block"
    localContext = context.createChildContext()
    statement.analyze(localContext) for statement in @statements

  optimize: ->
    # TODO

module.exports = Block
