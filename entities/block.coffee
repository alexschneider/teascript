class Block
  constructor: (@statements) ->

  toString: ->
    "(Block #{@statements.join(' ')})"

  analyze: (context) ->
    localContext = context.createChildContext()
    statement.analyze(localContext) for statement in @statements

  optimize: ->
    @statements = @statements.map((s) -> s.optimize()).filter((s) -> s?)
    this

  hasStatement: (statement) ->
    statementFound = false
    blocks = ['Block', 'ConditionalExpression', 'ForStatement', 'WhileStatement']
    for s in @statements
      name = s.constructor.name
      statementFound = switch
        when name is statement then true
        when name in blocks then s.hasStatement(statement)
        else false
      return true if statementFound
    return false

module.exports = Block
