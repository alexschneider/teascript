chai = require 'chai'
expect = chai.expect
LineScanner = require '../../../tools/line_scanner'

describe 'LineScanner', ->
  describe 'Extracting String Literals', ->

    describe '#extractedStringLiterals', ->

      context 'when the next token is a string without a defined ending', ->
        lineScanner = new LineScanner '\'this is a multiline string without a
                                       defined ending'
        result = lineScanner.extractedStringLiterals()

        it 'sets the current state of the mulitline string of the scanner to be
            true', ->
          expect(lineScanner.currentState.multiline.string).to.be.true

        it 'increments the scanner position to the end of the line', ->
          expect(lineScanner.position).to.equal 52

        it 'does not add any tokens yet to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql []

        it 'returns true since part of a multiline string was extracted', ->
          expect(result).to.be.true

      context 'when the scanner is in the middle of a multiline string', ->
        currentScannerState = multiline: string: true
        lineScanner = new LineScanner 'this is the continuation of a multiline
                                       string begun elsewhere \''
                                      , currentScannerState
        result = lineScanner.extractedStringLiterals()

        it 'toggles the current state of the multiline string of the scanner back
            to false', ->
          expect(lineScanner.currentState.multiline.string).to.be.false

        it 'increments the scanner position to the end of the string', ->
          expect(lineScanner.position).to.equal 64

        it 'adds the string token to the line tokens', ->
          expect(lineScanner.lineTokens).to
            .eql [{
              start: 0,
              kind: 'STRLIT',
              lexeme: 'this is the continuation of a multiline string begun
                       elsewhere \''
            }]

        it 'returns true since part of a multiline string was extracted', ->
          expect(result).to.be.true

      context 'when there is a multiline string with a defined ending', ->
        lineScanner = new LineScanner '\'this is a multiline string with a defined ending \'f := 5'
        result = lineScanner.extractedStringLiterals()

        it 'toggles the current state of the multiline string of the scanner back to false', ->
          expect(lineScanner.currentState.multiline.string).to.be.false

        it 'increments the scanner position to just after the string', ->
          expect(lineScanner.position).to.equal 51

        it 'adds the string literal to the line tokens', ->
          expect(lineScanner.lineTokens).to
            .eql [{
                start: 0,
                kind: 'STRLIT',
                lexeme: '\'this is a multiline string with a defined ending \''
              }]

        it 'returns true since part of a multiline string was extracted', ->
          expect(result).to.be.true
