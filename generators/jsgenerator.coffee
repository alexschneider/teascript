util = require('util')
HashMap = require('hashmap').HashMap

module.exports = (program) ->
  gen program

indentPadding = 4
indentLevel = 0
programCache = []
emit = (line) ->
  pad = indentPadding * indentLevel
  programCache.push "#{Array(pad+1).join(' ')}#{line}"

makeOp = (op) ->
  {not: '!', and: '&&', or: '||', '==': '===', '!=': '!=='}[op] or op

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
    emit '(function () {'
    gen program.block
    emit '}());'
    programCache.join '\n'

  Block: (block) ->
    indentLevel++
    gen statement for statement in block.statements
    indentLevel--

  VariableDeclaration: (id) ->
    emit "var #{makeVariable id} = #{gen id.value};"

  AssignmentStatement: (s) ->
    emit "#{gen s.target} = #{gen s.source};"

  WhileStatement: (s) ->
    emit "while (#{gen s.condition}) {"
    gen s.body
    emit '}'

  IntegerLiteral: (literal) -> literal.toString()

  BooleanLiteral: (literal) -> literal.toString()

  FloatLiteral: (literal) -> literal.toString()

  NoneLiteral: (literal) -> 'null'

  VariableReference: (v) -> makeVariable v.referent

  PreUnaryExpression: (e) ->
    "(#{makeOp e.op.lexeme} #{gen e.operand})"

  BinaryExpression: (e) ->
    "(#{gen e.left} #{makeOp e.op.lexeme} #{gen e.right})"
