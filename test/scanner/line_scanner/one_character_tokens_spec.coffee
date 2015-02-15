chai = require 'chai'
expect = chai.expect
LineScanner = require '../../../scanner/line_scanner'

describe 'LineScanner', ->
  describe 'Extracting One-Character Tokens', ->

    describe '#extractedOneCharacterTokens', ->

      context 'when a one-character token is the next token', ->
        lineScanner = new LineScanner '*5'
        extractionResult = lineScanner.extractedOneCharacterTokens()

        it 'accurately increments the current position of the scanner', ->
          expect(lineScanner.position).to.equal 1

        it 'adds the one-character token to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql [{
            kind: '*',
            lexeme: '*',
            start: 0
          }]

        it 'returns true since a one-character token was successfully
            extracted', ->
          expect(extractionResult).to.be.true

      context 'when a one-character token is not the next token', ->
        lineScanner = new LineScanner ' x'
        extractionResult = lineScanner.extractedOneCharacterTokens()

        it 'does not increment the current position of the scanner', ->
          expect(lineScanner.position).to.equal 0

        it 'does not add anything to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql []

        it 'returns false since a one-character token was not extracted', ->
          expect(extractionResult).to.be.false
