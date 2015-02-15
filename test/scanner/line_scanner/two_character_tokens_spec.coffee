chai = require 'chai'
expect = chai.expect
LineScanner = require '../../../tools/line_scanner'

describe 'LineScanner', ->
  describe 'Extracting Two-Character Tokens', ->

    describe '#extractedTwoCharacterTokens', ->

      context 'when a two-character token is the next token', ->
        lineScanner = new LineScanner '<='
        extractionResult = lineScanner.extractedTwoCharacterTokens()

        it 'accurately increments the current position of the scanner', ->
          expect(lineScanner.position).to.equal 2

        it 'adds the two-character token to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql [{
            kind: '<=',
            lexeme: '<=',
            start: 0
          }]

        it 'returns true since a two-character token was successfully
            extracted', ->
          expect(extractionResult).to.be.true

      context 'when a two-character token is not the next token', ->
        lineScanner = new LineScanner '.'
        extractionResult = lineScanner.extractedTwoCharacterTokens()

        it 'does not increment the current position of the scanner', ->
          expect(lineScanner.position).to.equal 0

        it 'does not add anything to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql []

        it 'returns false since a two-character token was not extracted', ->
          expect(extractionResult).to.be.false


