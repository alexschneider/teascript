util = require('util')
_ = require 'underscore'
HashMap = require('hashmap').HashMap

module.exports = (program) ->
  gen program

indentPadding = 4
indentLevel = 0
emit = (line, cache) ->
  pad = indentPadding * indentLevel
  cache.push "#{Array(pad+1).join(' ')}#{line}"

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
    gen program.block
    emit '}());', programCache
    programCache.join '\n'

  Block: (block) ->
    blockCache = []
    indentLevel++
    emit '(function() {', blockCache
    emit gen(statement), blockCache for statement in block.statements[..-1]
    emit "return #{gen _.last block.statements};", blockCache
    emit '}());', blockCache
    indentLevel--
    blockCache.join '\n'

  VariableDeclaration: (id) ->
    "var #{makeVariable id} = #{gen id.value};"

  AssignmentStatement: (s) ->
    "#{gen s.target} = #{gen s.source};"

  WhileStatement: (s) ->
    whileCache = []
    emit "while (#{gen s.condition}) {", whileCache
    emit gen(s.body), whileCache
    emit '}', whileCache
    whileCache.join '\n'

  ConditionalExpression: (s) ->
    conditionalCache = []
    emit '(function () {', conditionalCache
    emit "if (#{gen s.conditions[0]}) {", conditionalCache
    emit "return #{gen s.body}", conditionalCache
    emit '}', conditionalCache
    for [condition, body] in _.zip s.conditions[1..], s.bodies[1..]
      if condition?
        emit "else if (#{gen condition}) {", conditionalCache
      else
        emit 'else {', conditionalCache
      emit "return #{gen body}", conditionalCache
      emit '}', conditionalCache
    emit '}());', conditionalCache
    conditionalCache.join '\n'

  Function: (s) ->
    fc = []
    emit "function (#{(param.lexeme for param in @params).join ', '}) {", fc
    emit "return #{gen body};", fc
    emit "};", fc
    fc.join '\n'

  FunctionInvocation: (s) ->
    args = s.args.map makeVariable
    "#{gen s.func}(#{args.join ', '});"


  IntegerLiteral: (literal) -> literal.toString()

  BooleanLiteral: (literal) -> literal.toString()

  FloatLiteral: (literal) -> literal.toString()

  NoneLiteral: (literal) -> 'null'

  VariableReference: (v) -> makeVariable v.referent

  PreUnaryExpression: (e) ->
    "(#{makeOp e.op.lexeme} #{gen e.operand})"

  BinaryExpression: (e) ->
    "(#{gen e.left} #{makeOp e.op.lexeme} #{gen e.right})"
