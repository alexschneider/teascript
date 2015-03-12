chai = require 'chai'
expect = chai.expect
scan = require '../../scanner/scanner'
outputTokens = require '../example/output_tokens'
validProgramsPath = "#{__dirname}/../example/input_programs/valid_programs"
invalidProgramsPath = "#{__dirname}/../example/input_programs/invalid_programs"

# Ensure that this test is executed after the line scanner
requireDir = require 'require-dir'
requireDir "#{__dirname}/line_scanner"


describe 'Scanner', ->

  describe 'scanning valid teascript programs', ->
    describe 'valid teascript program #1', ->
      context 'when test program1.tea is passed through the scanner', ->
        expectedTokens1 = outputTokens.program1_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validProgramsPath}/program1.tea", (err, extractedTokens) ->
            expect(err).to.be.null
            expect(extractedTokens).to.eql expectedTokens1
            done()

    describe 'valid teascript program #2', ->
      context 'when test program2.tea is passed through the scanner', ->
        expectedTokens2 = outputTokens.program2_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validProgramsPath}/program2.tea", (err, extractedTokens) ->
            expect(err).to.be.null
            expect(extractedTokens).to.eql expectedTokens2
            done()

    describe 'valid teascript program #3', ->
      context 'when test program3.tea is passed through the scanner', ->
        expectedTokens3 = outputTokens.program3_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validProgramsPath}/program3.tea", (err, extractedTokens) ->
            expect(err).to.be.null
            expect(extractedTokens).to.eql expectedTokens3
            done()

    describe 'valid teascript program #4', ->
      context 'when test program4.tea is passed through the scanner', ->
        expectedTokens4 = outputTokens.program4_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validProgramsPath}/program4.tea", (err, extractedTokens) ->
            expect(err).to.be.null
            expect(extractedTokens).to.eql expectedTokens4
            done()

    describe 'teascript program #5', ->
      context 'when test program5.tea is passed through the scanner', ->
        expectedTokens5 = outputTokens.program5_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validProgramsPath}/program5.tea", (err, extractedTokens) ->
            expect(err).to.be.null
            expect(extractedTokens).to.eql expectedTokens5
            done()

  describe 'scanning invalid teascript programs', ->
    describe 'invalid teascript program #1', ->
      context 'when test program1.tea is passed through the scanner', ->

        it 'returns the appropriate error', (done) ->
          scan "#{invalidProgramsPath}/program1.tea", (err, extractedTokens) ->
            expect(err).to.equal 'line 0: invalid token at position 21'
            done()
