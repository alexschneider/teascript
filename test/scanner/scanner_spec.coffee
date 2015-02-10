sinon = require 'sinon'
chai = require 'chai'
sinonChai = require 'sinon-chai'
expect = chai.expect
scan = require '../../scanner'
outputTokens = require './output_tokens'


describe 'Scanner', ->
  describe 'teascript program #1', ->
    context 'when test program1.tea is passed through the scanner', ->
      expectedTokens1 = outputTokens.program1_tokens

      it 'returns the appropriate tokens', ->
        scan "#{__dirname}/input-programs/program1.tea", (extractedTokens) ->
          expect(extractedTokens).to.eql expectedTokens1

  describe 'teascript program #2', ->
    context 'when test program2.tea is passed through the scanner', ->
      expectedTokens2 = outputTokens.program2_tokens

      it 'returns the appropriate tokens', ->
        scan "#{__dirname}/input-programs/program2.tea", (extractedTokens) ->
          expect(extractedTokens).to.eql expectedTokens2

  describe 'teascript program #3', ->
    context 'when test program3.tea is passed through the scanner', ->
      expectedTokens3 = outputTokens.program3_tokens

      it 'returns the appropriate tokens', ->
        scan "#{__dirname}/input-programs/program3.tea", (extractedTokens) ->
          expect(extractedTokens).to.eql expectedTokens3

  describe 'teascript program #4', ->
    context 'when test program4.tea is passed through the scanner', ->
      expectedTokens4 = outputTokens.program4_tokens

      it 'returns the appropriate tokens', ->
        scan "#{__dirname}/input-programs/program4.tea", (extractedTokens) ->
          expect(extractedTokens).to.eql expectedTokens4