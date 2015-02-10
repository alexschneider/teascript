chai = require 'chai'
sinonChai = require 'sinon-chai'
expect = chai.expect
scan = require '../../scanner'
outputTokens = require './output_tokens'


describe 'Scanner', ->
  describe 'First scanner test', ->
    context 'when all valid tokens can be extracted from the program', ->
      expectedTokens = outputTokens.program1_tokens

      it 'returns the appropriate tokens for the first program', ->
        scan "#{__dirname}/input-programs/program1.tea", (extractedTokens) ->
          expect(extractedTokens).to.eql expectedTokens

  describe 'Second scanner test', ->
    context 'when all valid tokens can be extracted from the program', ->
      expectedTokens = outputTokens.program2_tokens

      it 'returns the appropriate tokens for the second program', ->
        scan "#{__dirname}/input-programs/program2.tea", (extractedTokens) ->
          expect(extractedTokens).to.eql expectedTokens