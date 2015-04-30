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

  describe 'compiling valid tuples', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program02.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program02
        done()

  describe 'compiling valid maps', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program03.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program03
        done()

  describe 'compiling valid sets', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program04.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program04
        done()

  describe 'compiling valid lists', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program05.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program05
        done()

  describe 'compiling the valid built in function "out"', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program06.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program06
        done()

  describe 'compiling single line functions', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program07.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program07
        done()

  describe 'compiling multiline functions', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program08.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program08
        done()

  describe 'compiling programs with conditionals', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program09.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program09
        done()

  describe 'compiling times built in function', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program10.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program10
        done()

  describe 'compiling a function with an argument', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program11.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program11
        done()

  describe 'compiling a function with two arguments', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program12.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program12
        done()

  describe 'compiling sqrt built in function', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program13.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program13
        done()
  describe 'treating if statements like expressions', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program14.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program14
        done()

  describe 'compiling for loops', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program15.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = generate program
        expect(program).to.eql expectedOutput.program15
        done()
