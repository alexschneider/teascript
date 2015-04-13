sinon = require 'sinon'
chai = require 'chai'
sinonChai = require 'sinon-chai'
chai.use(sinonChai)
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
        writeStub = sinon.stub(console, "log")
        generate program
        output = writeStub.args
        writeStub.restore()
        expect(line[0] for line in output).to.eql expectedOutput.program01
        done()
