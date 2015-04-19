util = require('util')
_ = require 'underscore'
HashMap = require('hashmap').HashMap

module.exports = (program) ->
  gen program

indentPadding = 4
indentLevel = 0
emit = (line, cache) ->
  pad = indentPadding * indentLevel
  # Having any more than two spaces is unnecessary unless it's part of an
  # indent. We need to make sure that two or more spaces follow a non-space
  # character to ensure it's not part of an indent
  toEmit = "#{Array(pad+1).join(' ')}#{line}".replace /([^ ])  +/, '$1 '
  if cache?
    cache.push toEmit
  toEmit

makeOp = (op) ->
  {not: '!', and: '&&', or: '||', is: '===', isnt: '!=='}[op] or op

makeVariable = do (lastId = 0, map = new HashMap()) ->
  (v) ->
    map.set v, ++lastId unless map.has(v)
    '_v' + map.get v

gen = (e) ->
  generator[e.constructor.name](e)

generator =

  Program: (program) ->
    programCache = []
    indentLevel = 0
    emit '(function () {', programCache
    indentLevel++
    programCache.push gen program.block
    indentLevel--
    emit '}());', programCache
    programCache.join '\n'

  Block: (block) ->
    blockCache = []
    blockCache.push gen statement for statement in block.statements
    blockCache.join '\n'

  VariableDeclaration: (id) ->
    emit "var #{makeVariable id} = #{gen id.value};"

  AssignmentStatement: (s) ->
    emit "#{gen s.target} = #{gen s.source};"

  WhileStatement: (s) ->
    whileCache = []
    emit "while (#{gen s.condition}) {", whileCache
    indentLevel++
    whileCache.push gen s.body
    indentLevel--
    emit '}', whileCache
    whileCache.join '\n'

  OutStatement: (s) -> "console.log(#{gen s.value});"

  ReturnStatement: (s) -> "return #{gen s.value};"

  ConditionalExpression: (s) ->
    conditionalCache = []
    emit '(function () {', conditionalCache
    #indentLevel++
    emit "if (#{gen s.conditions[0]}) {", conditionalCache
    #indentLevel++
    emit "return #{gen s.body}", conditionalCache
    #indentLevel--
    emit '}', conditionalCache
    for [condition, body] in _.zip s.conditions[1..], s.bodies[1..]
      if condition?
        emit "else if (#{gen condition}) {", conditionalCache
      else
        emit 'else {', conditionalCache
      #indentLevel++
      emit "return #{gen body}", conditionalCache
      #indentLevel--
      emit '}', conditionalCache
    #indentLevel--
    emit '}());', conditionalCache
    conditionalCache.join '\n'

  Function: (s) ->
    fc = []
    emit "function (#{(param.lexeme for param in @params).join ', '}) {", fc
    #indentLevel++
    emit "return #{gen body};", fc
    #indentLevel--
    emit '};', fc
    fc.join '\n'

  FunctionInvocation: (s) ->
    args = s.args.map makeVariable
    "#{gen s.func}(#{args.join ', '});"


  IntegerLiteral: (literal) -> literal.toString()

  BooleanLiteral: (literal) -> literal.toString()

  FloatLiteral: (literal) -> literal.toString()

  NoneLiteral: (literal) -> 'null'

  StringLiteral: (literal) -> literal.toString()

  ListLiteral: (literal) ->
    llCache = []
    emit '[', llCache
    #indentLevel++
    elCache = []
    emit "#{gen element}" for element in literal.elements
    #indentLevel--
    emit elCache.join(',\n'), llCache
    emit ']'
    llCache.join '\n'

  MapLiteral: (literal) -> literal.toString()

  SetLiteral: (literal) ->
    slCache = []
    emit '{', slCache
    memCache = []
    #indentLevel++
    emit "#{gen member}: true", memCache for member in literal.members
    emit memCache.join(',\n'), slCache
    #indentLevel--
    emit '}'
    slCache.join '\n'

  TupleLiteral: (literal) ->
    generator['ListLiteral'](literal)

  VariableReference: (v) -> makeVariable v.referent

  PreUnaryExpression: (e) ->
    "(#{makeOp e.op.lexeme} #{gen e.operand})"

  BinaryExpression: (e) ->
    "(#{gen e.left} #{makeOp e.op.lexeme} #{gen e.right})"
