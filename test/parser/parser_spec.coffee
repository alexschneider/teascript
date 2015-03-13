chai = require 'chai'
expect = chai.expect
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
ParseError = require '../../error/parse_error'
validProgramsPath = "#{__dirname}/../example/input_programs/valid_programs"
invalidProgramsPath = "#{__dirname}/../example/input_programs/invalid_programs"
outputASTs = require "#{__dirname}/../example/output_ASTs"

# Ensure this test runs after the scanner test
require '../scanner/scanner_spec'


describe 'Parser', ->

  describe 'parsing a valid variable declaration/assignment', ->
    context 'when a variable is declared and assigned to a
             primitive or reference literal
             (int/float/bool/none or string/map/list/set/tuple)', ->

      # TODO: IMPLEMENT AND TEST TUPLE LITERALS
      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program6.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.equal outputASTs.program6_AST_string
          done()

    context 'when a variable is declared and assigned to a
             unary expression', ->

      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program7.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program7_AST_string
          done()

    context 'when a variable is declared and assigned to a
             binary expression', ->

      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program8.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program8_AST_string
          done()

  describe 'parsing a valid for statement', ->
    context 'when an iterable literal or ID is being iterated over', ->

      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program9.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program9_AST_string
          done()

    context 'when we have exponentsm they are right associative and
              unary negation has different precedence on the left and right
              of the ** operator', ->

      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program14.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program14_AST_string
          done()

  describe 'parsing a valid while statement', ->
    context 'when parsing single line and multiline while statements', ->

      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program10.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program10_AST_string
          done()

  describe 'parsing a valid function declaration', ->
    context 'when parsing functions declared
             both with and without parameters', ->

      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program11.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program11_AST_string
          done()

  describe 'parsing a valid function invocation', ->
    context 'when parsing functions invoked
            both with and without arguments', ->

      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program12.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program12_AST_string
          done()

  describe 'parsing a valid conditional expression', ->
    context 'when a conditional has if, else, and else if branches', ->

      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program13.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program13_AST_string
          done()

  describe 'parsing a valid class expression', ->
    context 'when a class is declared with functions,
             properties, and a constructor', ->
      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program17.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program17_AST_string
          done()

  describe 'parsing a valid ternary expression', ->
    context 'when there is an if and else part of the ternary', ->
      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program15.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program15_AST_string
          done()

    context 'when there is an if part of the ternary only', ->
      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program16.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program16_AST_string
          done()

  describe 'parsing a valid program', ->
    context 'when there is a recursive function call', ->
      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program18.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program18_AST_string
          done()

  describe 'parsing a valid program', ->
    context 'when there is a function call in a for loop', ->
      it 'parses correctly', (done) ->
        scan "#{validProgramsPath}/program19.tea", (err, tokens) ->
          program = parse tokens
          expect(program.toString()).to.eql outputASTs.program19_AST_string
          done()

  describe 'parsing an invalid program', ->
    context 'when an invalid program is scanned, but not parsed', ->
      it 'throws an exception', (done) ->
        scan "#{invalidProgramsPath}/program2.tea", (err, tokens) ->
          expect(-> parse tokens).to.throw 'line 0: Expected newline, found ID'
          done()

    context 'when the first statement of a block is invalid', ->
      it 'throws an exception', (done) ->
        scan "#{invalidProgramsPath}/program3.tea", (err, tokens) ->
          expect(-> parse tokens).to.throw 'is invalid start for a statement'
          done()
