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
  toEmit = "#{Array(pad+1).join(' ')}#{line}".replace /([^\s])  +/g, '$1 '
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
    emit "while ( #{gen s.condition} ) {", whileCache
    indentLevel++
    whileCache.push gen s.body
    indentLevel--
    emit '}', whileCache
    whileCache.join '\n'

  ReturnStatement: (s) -> emit "return #{gen s.value};"

  ConditionalExpression: (e) ->
    conditionalCache = []
    emit '(function () {', conditionalCache
    #indentLevel++
    emit "if (#{gen e.conditions[0]}) {", conditionalCache
    #indentLevel++
    emit "return #{gen e.body}", conditionalCache
    #indentLevel--
    emit '}', conditionalCache
    for [condition, body] in _.zip e.conditions[1..], e.bodies[1..]
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

  Function: (func) ->
    fc = []
    emit "function (#{(param.lexeme for param in func.params).join ', '}) {", fc
    #indentLevel++
    emit "return #{gen func.body};", fc
    #indentLevel--
    emit '};', fc
    fc.join '\n'

  FunctionInvocation: (s) ->
    args = s.args.map makeVariable
    "#{gen s.func}(#{args.join ', '});"


  IntegerLiteral: (l) -> emit l.toString()

  BooleanLiteral: (l) -> emit l.toString()

  FloatLiteral: (l) -> emit l.toString()

  NoneLiteral: (l) -> emit 'null'

  StringLiteral: (l) -> emit l.toString()

  ListLiteral: (l) ->
    llCache = []
    emit '[', llCache
    indentLevel++
    elements = l.elements.map gen
    indentLevel--
    llCache.push elements.join ',\n'
    emit ']', llCache
    llCache.join '\n'

  MapLiteral: (l) ->
    mlCache = []
    emit '{', mlCache
    indentLevel++
    kvCache = []
    values = l.values.map gen
    emit "#{key.lexeme}: #{val}", kvCache for [key, val] in _.zip l.keys, values
    indentLevel--
    mlCache.push kvCache.join ',\n'
    emit '}', mlCache
    mlCache.join '\n'

  SetLiteral: (l) ->
    slCache = []
    emit '{', slCache
    memCache = []
    indentLevel++
    emit "#{gen member}: true", memCache for member in l.members
    indentLevel--
    slCache.push memCache.join ',\n'
    emit '}', slCache
    slCache.join '\n'

  TupleLiteral: (l) ->
    generator['ListLiteral'](l)

  VariableReference: (v) -> makeVariable v.referent

  PreUnaryExpression: (e) ->
    emit "( #{makeOp e.op.lexeme} #{gen e.operand} )"

  BinaryExpression: (e) ->
    emit "( #{gen e.left} #{makeOp e.op.lexeme} #{gen e.right} )"
