chai = require 'chai'
expect = chai.expect
CustomError = require '../../error/custom_error'
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
generate = require '../../generators/jsgenerator'
validTeascriptProgramsPath = "#{__dirname}/input_programs/valid_programs"
expectedOutput = require "#{__dirname}/expected_output/optimized_output"

describe 'optimizing constant folding', ->
    it 'outputs the correct javascript', (done) ->
      scan "#{validTeascriptProgramsPath}/program01.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        program = program.optimize()
        program = generate program
        expect(program).to.eql expectedOutput.program01
        done()