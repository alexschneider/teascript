chai = require 'chai'
expect = chai.expect
parse = require '../../parser/parser'
outputTokens = require '../example/output_tokens'
scan = require '../../scanner/scanner'
validProgramsPath = "#{__dirname}/../example/input_programs/valid_programs"

describe 'Scanner', ->

  describe 'parsing valid teascript programs', ->
    describe 'valid teascript program #1', ->
      context "when test program1.tea's tokens
               are passed through the scanner", ->
        it 'blah blah', ->
          scan "#{validProgramsPath}/program6.tea", (err, tokens) ->
            console.log tokens
            x = parse tokens
            console.log JSON.stringify(x)
