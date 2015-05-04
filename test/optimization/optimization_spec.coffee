chai = require 'chai'
expect = chai.expect
CustomError = require '../../error/custom_error'
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
generate = require '../../generators/jsgenerator'
validTeascriptProgramsPath = "#{__dirname}/input_programs/valid_programs"
expectedOutput = require "#{__dirname}/expected_output/optimized_output"

describe 'optimizing constant folding for arithmetic integer operations', ->
  it 'outputs the correct javascript', (done) ->
    scan "#{validTeascriptProgramsPath}/program01.tea", (err, tokens) ->
      program = parse tokens
      program.analyze()
      program = program.optimize()
      program = generate program
      expect(program).to.eql expectedOutput.program01
      done()

describe 'optimizing constant folding for boolean operations with integers', ->
  it 'outputs the correct javascript', (done) ->
    scan "#{validTeascriptProgramsPath}/program02.tea", (err, tokens) ->
      program = parse tokens
      program.analyze()
      program = program.optimize()
      program = generate program
      expect(program).to.eql expectedOutput.program02
      done()

describe 'optimizing constant folding for boolean constants', ->
  it 'outputs the correct javascript', (done) ->
    scan "#{validTeascriptProgramsPath}/program03.tea", (err, tokens) ->
      program = parse tokens
      program.analyze()
      program = program.optimize()
      program = generate program
      expect(program).to.eql expectedOutput.program03
      done()

describe 'optimizing constant folding for boolean constants', ->
  it 'outputs the correct javascript', (done) ->
    scan "#{validTeascriptProgramsPath}/program04.tea", (err, tokens) ->
      program = parse tokens
      program.analyze()
      program = program.optimize()
      program = generate program
      expect(program).to.eql expectedOutput.program04
      done()