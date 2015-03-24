chai = require 'chai'
expect = chai.expect
scan = require '../../scanner/scanner'
outputTokens = require "#{__dirname}/expected_output/output_tokens"
validScannerPrograms = "#{__dirname}/input_programs/valid_programs"
invalidScannerPrograms = "#{__dirname}/input_programs/invalid_programs"

describe 'Scanner', ->

  describe 'scanning valid teascript programs', ->
    describe 'valid teascript program #1', ->
      context 'when test program1.tea is passed through the scanner', ->
        expectedTokens1 = outputTokens.program1_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validScannerPrograms}/program1.tea", (err, tokens) ->
            expect(err).to.be.null
            expect(tokens).to.eql expectedTokens1
            done()

    describe 'valid teascript program #2', ->
      context 'when test program2.tea is passed through the scanner', ->
        expectedTokens2 = outputTokens.program2_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validScannerPrograms}/program2.tea", (err, tokens) ->
            expect(err).to.be.null
            expect(tokens).to.eql expectedTokens2
            done()

    describe 'valid teascript program #3', ->
      context 'when test program3.tea is passed through the scanner', ->
        expectedTokens3 = outputTokens.program3_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validScannerPrograms}/program3.tea", (err, tokens) ->
            expect(err).to.be.null
            expect(tokens).to.eql expectedTokens3
            done()

    describe 'valid teascript program #4', ->
      context 'when test program4.tea is passed through the scanner', ->
        expectedTokens4 = outputTokens.program4_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validScannerPrograms}/program4.tea", (err, tokens) ->
            expect(err).to.be.null
            expect(tokens).to.eql expectedTokens4
            done()

    describe 'teascript program #5', ->
      context 'when test program5.tea is passed through the scanner', ->
        expectedTokens5 = outputTokens.program5_tokens

        it 'returns the appropriate tokens', (done) ->
          scan "#{validScannerPrograms}/program5.tea", (err, tokens) ->
            expect(err).to.be.null
            expect(tokens).to.eql expectedTokens5
            done()

  describe 'scanning invalid teascript programs', ->
    describe 'invalid teascript program #1', ->
      context 'when test program1.tea is passed through the scanner', ->

        it 'returns the appropriate error', (done) ->
          scan "#{invalidScannerPrograms}/program1.tea", (err, tokens) ->
            expect(err).to.equal 'line 0: invalid token at position 21'
            done()

    describe 'invalid teascript program #2', ->
      context 'when test program2.tea is passed through the scanner', ->

        it 'returns the appropriate error', (done) ->
          scan "#{invalidScannerPrograms}/program2.tea", (err, tokens) ->
            expect(err).to.equal 'line 0: invalid token at position 23'
            done()

