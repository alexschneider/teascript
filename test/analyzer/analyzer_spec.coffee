chai = require 'chai'
expect = chai.expect
parse = require '../../parser/parser'
scan = require '../../scanner/scanner'
validParserProgramsPath = "#{__dirname}/input_programs/valid_programs"


describe 'Parser', ->

  describe 'parsing a valid program', ->
    it 'parses correctly', (done) ->
      scan "#{validParserProgramsPath}/program01.tea", (err, tokens) ->
        program = parse tokens
        program.analyze()
        done()
