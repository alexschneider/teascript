_ = require 'underscore'
HashMap = require('hashmap').HashMap
BuiltIn = require '../entities/built_in_entities'
Type = require '../entities/type'

map = null
lastId = null
module.exports = (program) ->
  map = new HashMap()
  lastId = 0
  gen program

indentPadding = 4
indentLevel = 0
emit = (line, cache) ->
  pad = indentPadding * indentLevel
  # Having any more than two spaces is unnecessary unless it's part of an
  # indent. We need to make sure that two or more spaces follow a non-space
  # character to ensure it's not part of an indent
  # Also, we want to be liberal with our semicoloning, but multiple semicolons
  # are redundant, so we need to get rid of them.
  toEmit = "#{Array(pad+1).join(' ')}#{line}"
            .replace /([^\s])  +/g, '$1 '
            .replace /;;+/g, ';' #TODO: handle this a little more elegantly
  if cache?
    cache.push toEmit
  toEmit

makeOp = (op) ->
  {not: '!', and: '&&', or: '||', is: '===', isnt: '!=='}[op] or op

makeVariable = (v) ->
  map.set v, ++lastId unless map.has(v)
  '_v' + map.get v

convertToArray = (obj) ->
  if obj.type.name is Type.STR.name
    stringToCharArray obj.value.lexeme[1..-2]
  else
    gen obj

stringToCharArray = (str) ->
  arrStr = '[' + (str.split('').map (arg) -> "\"#{arg}\"") + ']'


gen = (e) ->
  generator[e.constructor.name](e)

generator =

  Program: (program) ->
    programBuffer = []
    indentLevel = 0
    emit '(function () {', programBuffer
    indentLevel++
    programBuffer.push gen program.block
    indentLevel--
    emit '}());', programBuffer
    programBuffer.join '\n'

  Block: (block) ->
    # TODO: Determine if last line of block needs to be returned
    blockBuffer = []
    emit '(function () {', blockBuffer
    indentLevel++
    blockBuffer.push gen statement for statement in block.statements
    indentLevel--
    emit '}());', blockBuffer
    blockBuffer.join '\n'

  VariableDeclaration: (variable) ->
    emit "var #{makeVariable variable} = #{gen variable.value};"

  AssignmentStatement: (s) ->
    emit "#{gen s.target} = #{gen s.source};"

  WhileStatement: (s) ->
    whileBuffer = []
    emit "while ( #{gen s.condition} ) {", whileBuffer
    indentLevel++
    whileBuffer.push gen s.body
    indentLevel--
    emit '}', whileBuffer
    whileBuffer.join '\n'

  ReturnStatement: (s) -> emit "return #{gen s.value};"

  ConditionalExpression: (e) ->
    conditionalBuffer = []
    emit '(function () {', conditionalBuffer
    indentLevel++
    emit "if (#{gen e.conditions[0]}) {", conditionalBuffer
    indentLevel++
    emit "return #{gen e.bodies[0]}", conditionalBuffer
    indentLevel--
    for [condition, body] in _.zip e.conditions[1..], e.bodies[1..]
      if condition?
        emit "} else if (#{gen condition}) {", conditionalBuffer
      else
        emit '} else {', conditionalBuffer
      indentLevel++
      emit "return #{gen body}", conditionalBuffer
      indentLevel--
    emit '}', conditionalBuffer
    indentLevel--
    emit '}());', conditionalBuffer
    conditionalBuffer.join '\n'

  Function: (func) ->
    fc = []
    emit "function (#{(makeVariable param for param in func.params).join ', '}) {", fc
    indentLevel++
    emit "return #{gen func.body};", fc
    indentLevel--
    emit '};', fc
    fc.join '\n'

  IterableItem: (item) ->
    emit "#{gen item.iterable}[#{gen item.itemFinder}]"

  FunctionInvocation: (s) ->
    args = s.args.map (arg) -> gen arg
    if s.func.referent?.builtIn
      emit BuiltIn.entities[s.func.toString()].generateCode args
    else
      emit "#{gen s.func}(#{args.join ', '});"


  IntegerLiteral: (l) -> emit l.toString()

  BooleanLiteral: (l) -> emit l.toString()

  FloatLiteral: (l) -> emit l.toString()

  NoneLiteral: (l) -> emit 'null'

  StringLiteral: (l) -> emit l.toString()

  ListLiteral: (l) ->
    llBuffer = []
    emit '[', llBuffer
    indentLevel++
    elements = l.elements.map gen
    indentLevel--
    llBuffer.push elements.join ',\n'
    emit ']', llBuffer
    llBuffer.join '\n'

  MapLiteral: (l) ->
    mlBuffer = []
    emit '{', mlBuffer
    indentLevel++
    kvBuffer = []
    values = l.values.map gen
    emit "'#{key.lexeme}': #{val}", kvBuffer for [key, val] in _.zip l.keys, values
    indentLevel--
    mlBuffer.push kvBuffer.join ',\n'
    emit '}', mlBuffer
    mlBuffer.join '\n'

  SetLiteral: (l) ->
    slBuffer = []
    emit '{', slBuffer
    indentLevel++
    slBuffer.push l.members.map((member) -> "#{gen member}: true").join ',\n'
    indentLevel--
    emit '}', slBuffer
    slBuffer.join '\n'

  TupleLiteral: (l) -> generator['ListLiteral'](l)

  Range: (l) ->
    rBuffer = []
    lb = gen l.num1
    ub = if l.op.lexeme is '...' then gen l.num2 else (gen l.num2).concat(' - 1')
    skip = if l.skip then gen l.skip else 1

    emit '(function(lb, ub, skip) {', rBuffer
    indentLevel++
    emit 'var temp = [];', rBuffer
    emit 'for(var i = lb; i < ub; i += skip ) {', rBuffer
    indentLevel++
    emit 'temp.push(i);', rBuffer
    indentLevel--
    emit '}', rBuffer
    emit 'return temp;', rBuffer
    indentLevel--
    emit "})(#{lb}, #{ub}, #{skip})", rBuffer
    rBuffer.join '\n'

  VariableReference: (v) -> makeVariable v.referent

  PreUnaryExpression: (e) ->
    emit "( #{makeOp e.op.lexeme} #{gen e.operand} )"

  BinaryExpression: (e) ->
    emit "( #{gen e.left} #{makeOp e.op.lexeme} #{gen e.right} )"

  ForStatement: (s) ->
    fsBuffer = []
    iterable = convertToArray s.iterable
    emit "(#{iterable}).forEach( function (#{makeVariable s.id}) {" , fsBuffer
    indentLevel++
    emit "#{gen s.body}", fsBuffer
    indentLevel--
    emit '})', fsBuffer
    fsBuffer.join '\n'

