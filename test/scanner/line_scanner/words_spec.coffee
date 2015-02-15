chai = require 'chai'
expect = chai.expect
LineScanner = require '../../../scanner/line_scanner'

describe 'LineScanner', ->
  describe 'Extracting Words', ->

    describe '#extractedWords', ->

      context 'when a reserved word is the next token', ->
        lineScanner = new LineScanner 'bool ='
        extractionResult = lineScanner.extractedWords()


        it 'accurately increments the current position of the scanner', ->
          expect(lineScanner.position).to.equal 4

        it 'adds the reserved word to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql [{
            kind: 'bool',
            lexeme: 'bool',
            start: 0
          }]

        it 'returns true since it was successful in extracting a word', ->
          expect(extractionResult).to.be.true

      context 'when an identifer is the next token', ->
        lineScanner = new LineScanner 'myVariable := () ->'
        extractionResult = lineScanner.extractedWords()

        it 'accurately increments the current position of the scanner', ->
          expect(lineScanner.position).to.equal 10

        it 'adds the identifer to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql [{
            kind: 'ID',
            lexeme: 'myVariable',
            start: 0
          }]

        it 'returns true since it was successful in extracting a word', ->
          expect(extractionResult).to.be.true

      context 'when a word is not the next token', ->
        lineScanner = new LineScanner '* 5'
        extractionResult = lineScanner.extractedWords()

        it 'does not increment the current position of the scanner', ->
          expect(lineScanner.position).to.equal 0

        it 'does not add anything to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql []

        it 'returns false since it could not extract a word', ->
          expect(extractionResult).to.be.false

      context 'when an identifier is only one character', ->
        lineScanner = new LineScanner 'x := 123456'
        extractionResult = lineScanner.extractedWords()

        it 'accurately increments the current position of the scanner', ->
          expect(lineScanner.position).to.equal 1

        it 'adds the identifer to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql [{
            kind: 'ID',
            lexeme: 'x',
            start: 0
          }]

        it 'returns true since it was successful in extracting a word', ->
          expect(extractionResult).to.be.true

      context 'when an identifier that does not begin with a letter is next', ->
        lineScanner = new LineScanner '5myVar = 1'
        extractionResult = lineScanner.extractedWords()

        it 'does not increment the current position of the scanner', ->
          expect(lineScanner.position).to.equal 0

        it 'does not add anything to the line tokens', ->
          expect(lineScanner.lineTokens).to.eql []

        it 'returns false since it could not extract a word', ->
          expect(extractionResult).to.be.false
