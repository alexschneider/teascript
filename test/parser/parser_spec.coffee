chai = require 'chai'
expect = chai.expect
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
ParseError = require '../../error/parse_error'
validProgramsPath = "#{__dirname}/../example/input_programs/valid_programs"
invalidProgramsPath = "#{__dirname}/../example/input_programs/invalid_programs"
outputASTs = require "#{__dirname}/../example/output_ASTs"


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

  describe 'parsing an invalid program', ->
    context 'when an invalid program is scanned, but not parsed', ->
      it 'throws an exception', (done) ->
        scan "#{invalidProgramsPath}/program2.tea", (err, tokens) ->
          fn = -> parse tokens
          expect(fn).to.throw 'line 0: Expected newline, found ID'
