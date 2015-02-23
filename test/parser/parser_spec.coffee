chai = require 'chai'
expect = chai.expect
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
validProgramsPath = "#{__dirname}/../example/input_programs/valid_programs"
outputASTs = require "#{__dirname}/../example/output_ASTs"


describe 'Parser', ->

  describe 'parsing a variable declaration', ->
    context 'when a variable is assigned to an integer literal', ->

      it 'creates an accurate abstract syntax tree', ->
        scan "#{validProgramsPath}/program6.tea", (err, tokens) ->
          AST = parse tokens
          expect(AST.toString()).to.eql outputASTs.program6_AST_string

