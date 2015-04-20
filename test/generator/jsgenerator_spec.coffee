chai = require 'chai'
expect = chai.expect
CustomError = require '../../error/custom_error'
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
generate = require '../../generators/jsgenerator'
validTeascriptProgramsPath = "#{__dirname}/input_programs/valid_programs"
expectedOutput = require "#{__dirname}/expected_output/compiled_output"

describe 'JS generator', ->

  describe 'fully compiling a valid program', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program01.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program01
        done()

  describe 'compiling a valid list', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program02.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program02
        done()

  describe 'compiling a valid map', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program03.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program03
        done()