chai = require 'chai'
expect = chai.expect
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
validProgramsPath = "#{__dirname}/../example/input_programs/valid_programs"
outputASTs = require "#{__dirname}/../example/output_ASTs"


describe 'Parser', ->

  describe 'parsing a variable declaration/assignment', ->
    context 'when a variable is declared and assigned to a
             string/int/float/boolean/none literal', ->

      it 'creates an accurate AST', (done) ->
        scan "#{validProgramsPath}/program6.tea", (err, tokens) ->
          AST = parse tokens
          expect(AST.toString()).to.equal outputASTs.program6_AST_string
          done()

    context 'when a variable is declared and assigned to a
             unary expression', ->

      it 'creates an accurate AST', (done) ->
        scan "#{validProgramsPath}/program7.tea", (err, tokens) ->
          AST = parse tokens
          expect(AST.toString()).to.eql outputASTs.program7_AST_string
          done()

    context 'when a variable is declared and assigned to a
             binary expression', ->

      it 'creates an accurate AST', (done) ->
        scan "#{validProgramsPath}/program8.tea", (err, tokens) ->
          AST = parse tokens
          expect(AST.toString()).to.eql outputASTs.program8_AST_string
          done()

  describe 'parsing a for statement', ->
    context 'when an iterable literal is being iterated over', ->

      it 'creates an accurate AST', ->
        # TODO
