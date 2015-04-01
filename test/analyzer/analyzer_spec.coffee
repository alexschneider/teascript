chai = require 'chai'
expect = chai.expect
CustomError = require '../../error/custom_error'
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
validParserProgramsPath = "#{__dirname}/input_programs/valid_programs"
invalidParserProgramsPath = "#{__dirname}/input_programs/invalid_programs"
analyzedPrograms = require "#{__dirname}/expected_output/analyzed_programs"



describe 'Semantic Analyzer', ->

  # For each test we have to compare the stringified versions
  # of programs with expected output since our 'program' variable
  # is decorated with functions (analyze(), toString(), optimize())
  # and thus won't be considered deeply equal unless we decorate our
  # expected output with the same functions

  describe 'analyzing a valid program', ->
    context 'when analyzing primitive/reference types', ->
      it 'analyzes correctly and adds proper type annotations', (done) ->
        scan "#{validParserProgramsPath}/program01.tea", (err, tokens) ->
          program = parse tokens
          program.analyze()
          expect(JSON.stringify(program)).to.eql analyzedPrograms.program01
          done()



  describe 'analyzing an invalid program', ->
    context 'when a variable has been declared multiple
              times in the same context', ->
      it 'throws an error', (done) ->
        scan "#{invalidParserProgramsPath}/program01.tea", (err, tokens) ->
          program = parse tokens

          error = 'line 6: Variable x already declared'
          expect(-> program.analyze()).to.throw error

          done()
