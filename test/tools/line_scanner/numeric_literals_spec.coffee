chai = require 'chai'
expect = chai.expect
LineScanner = require '../../../tools/line_scanner'

describe 'LineScanner', ->
  describe 'Extracting Numeric Literals', ->

    describe '#extractedNumericLiterals', ->

      context 'when a integer literal is the next token', ->
        lineScanner = new LineScanner "23456"
        extractionResult = lineScanner.extractedNumericLiterals()

        it 'accurately increments the current position of the scanner', ->
          expect(lineScanner.position).to.equal 5

        it 'adds the integer literal to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql [{
            kind: 'INTLIT',
            lexeme: '23456',
            start: 0
          }]

        it 'returns true since a numeric literal was extracted', ->
          expect(extractionResult).to.be.true

      context 'when two numeric literals are separated by something other than a period', ->
        lineScanner = new LineScanner "234k567"
        extractionResult = lineScanner.extractedNumericLiterals()

        it 'accurately increments the current position of the scanner', ->
          expect(lineScanner.position).to.equal 3

        it 'adds the integer literal to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql [{kind: 'INTLIT', lexeme: '234', start: 0}]

        it 'returns true since a numeric literal was extracted', ->
          expect(extractionResult).to.be.true

      context 'when a float literal is the next token', ->
        lineScanner = new LineScanner "123.456"
        extractionResult = lineScanner.extractedNumericLiterals()

        it 'accurately increments the current position of the scanner', ->
          expect(lineScanner.position).to.equal 7

        it 'adds the integer literal to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql [{
            kind: 'FLOATLIT',
            lexeme: '123.456',
            start: 0
          }]

        it 'returns true since a numeric literal was extracted', ->
          expect(extractionResult).to.be.true

      context 'when numbers followed by a period is the next sequence of characters', ->
        lineScanner = new LineScanner '123.'
        extractionResult = lineScanner.extractedNumericLiterals()

        it 'reads the input as a INTLIT (followed by a period operator)
            rather than a FLOATLIT', ->
          expect(lineScanner.lineTokens).to.eql [{kind: 'INTLIT', lexeme: '123', start:0}]

      context 'when a numeric literal is not the next token', ->
        lineScanner = new LineScanner "abc.1234"
        extractionResult = lineScanner.extractedNumericLiterals()

        it 'does not increment the current position of the scanner', ->
          expect(lineScanner.position).to.equal 0

        it 'does not add anything to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql []

        it 'returns false since no numeric literal was extracted', ->
          expect(extractionResult).to.be.false