class Block
  constructor: (@statements) ->

  toString: ->
    "(Block #{@statements.join(' ')})"

  analyze: (context) ->
    localContext = context.createChildContext()
    statement.analyze(localContext) for statement in @statements

  optimize: ->
    @statements = @statements.map((s) -> s.optimize()).filter((s) -> s?)
    if statements.length is 0
      return null
    this

  expression: true

module.exports = Block
