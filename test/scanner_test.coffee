chai = require 'chai'
expect = chai.expect
Tokens = require './scanner_test1_tokens'
Scanner = require '../scanner'

describe 'Scanner', ->
  describe '#Dunno yet', ->
    context 'What we are testing for going on in the test', ->
      it 'What we expected to happen if it worked', ->
        Scanner './scanner_test1.txt', ->
          console.log tokens
          expect(tokens).to.eql Tokens.tokens2
          # done()
