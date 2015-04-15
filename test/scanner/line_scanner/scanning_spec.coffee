sinon = require 'sinon'
chai = require 'chai'
sinonChai = require 'sinon-chai'
expect = chai.expect
chai.use(sinonChai)
LineScanner = require '../../../scanner/line_scanner'
scan = require '../../../scanner/scanner'

describe 'LineScanner', ->
  describe '#scan', ->
    context 'when the line has valid teascript tokens', ->
      lineScanner = new LineScanner "f :=  -> 'hello' a.move() true # comment"
      {lineTokens} = lineScanner.scan()

      it 'returns the appropriate tokens', ->
        expect(lineTokens).to.eql [
          {kind: 'ID', lexeme: 'f', start: 0},
          {kind: ':=', lexeme: ':=', start: 2},
          {kind: '->', lexeme: '->', start: 6},
          {kind: 'STRLIT', lexeme: "'hello'", start: 9},
          {kind: 'ID', lexeme: 'a', start: 17},
          {kind: '.', lexeme: '.', start: 18},
          {kind: 'ID', lexeme: 'move', start: 19},
          {kind: '(', lexeme: '(', start: 23},
          {kind: ')', lexeme: ')', start: 24},
          {kind: 'true', lexeme: 'true', start: 26},
          {kind: 'newline', lexeme: 'newline', start: 27}
        ]

    context 'when the line is empty', ->
      lineScanner = new LineScanner ''
      lineScanner.skippedSpaces = sinon.stub()
      lineScanner.skippedMultiComments = sinon.stub()
      lineScanner.skippedSingleComments = sinon.stub()
      lineScanner.extractedTwoCharacterTokens = sinon.stub()
      lineScanner.extractedOneCharacterTokens = sinon.stub()
      lineScanner.extractedWords = sinon.stub()
      lineScanner.extractedNumericLiterals = sinon.stub()
      result = lineScanner.scan()

      it 'returns without trying to extract any tokens/skip any characters', ->
        expect(lineScanner.skippedSpaces).to.not.have.been.called
        expect(lineScanner.skippedMultiComments).to.not.have.been.called
        expect(lineScanner.skippedSingleComments).to.not.have.been.called
        expect(lineScanner.extractedTwoCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractedOneCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractedWords).to.not.have.been.called
        expect(lineScanner.extractedNumericLiterals).to.not.have.been.called

      it 'returns a result with no line tokens', ->
        expect(result.lineTokens).to.eql []

    context 'when the line is full of spaces', ->
      lineScanner = new LineScanner '                    '
      lineScanner.extractedTwoCharacterTokens = sinon.stub()
      lineScanner.extractedOneCharacterTokens = sinon.stub()
      lineScanner.extractedWords = sinon.stub()
      lineScanner.extractedNumericLiterals = sinon.stub()
      lineScanner.scan()

      it 'returns without trying to extract any tokens', ->
        expect(lineScanner.extractedTwoCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractedOneCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractedWords).to.not.have.been.called
        expect(lineScanner.extractedNumericLiterals).to.not.have.been.called

    context 'when the line is commented out', ->
      lineScanner = new LineScanner '# example commented out line'
      lineScanner.extractedTwoCharacterTokens = sinon.stub()
      lineScanner.extractedOneCharacterTokens = sinon.stub()
      lineScanner.extractedWords = sinon.stub()
      lineScanner.extractedNumericLiterals = sinon.stub()
      lineScanner.scan()

      it 'returns without trying to extract any tokens', ->
        expect(lineScanner.extractedTwoCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractedOneCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractedWords).to.not.have.been.called
        expect(lineScanner.extractedNumericLiterals).to.not.have.been.called
