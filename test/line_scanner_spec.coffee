sinon = require 'sinon'
chai = require 'chai'
sinonChai = require 'sinon-chai'
expect = chai.expect
chai.use(sinonChai)
LineScanner = require '../tools/line_scanner'
scan = require '../scanner.coffee'

describe 'LineScanner', ->
  describe '#scan', ->
    context 'when the line has valid teascript tokens', ->
      lineScanner = new LineScanner "f :=  -> 'hello' a.move() bool # comment"
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
          {kind: 'bool', lexeme: 'bool', start: 26},
          {kind: 'newline', lexeme: 'newline', start: 27}
        ]

    context 'when the line is empty', ->
      lineScanner = new LineScanner ""
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

    context 'when the line is full of spaces', ->
      lineScanner = new LineScanner "                    "
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
      lineScanner = new LineScanner "# example commented out line"
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


  describe '#skippedSpaces', ->

    context 'when spaces are the next characters', ->
      lineScanner = new LineScanner "        x := 5"
      result = lineScanner.skippedSpaces()

      it 'increments the scanner position to the first non-space character', ->
        expect(lineScanner.position).to.equal 8

      it 'returns true since one or more spaces were skipped', ->
        expect(result).to.be.true

    context 'when spaces are not the next characters', ->
      lineScanner = new LineScanner "x := 5"
      result = lineScanner.skippedSpaces()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'returns false since no spaces were skipped', ->
        expect(result).to.be.false


  describe '#skippedMultiComments', ->

    context 'when there is a multiline comment without a defined ending', ->
      lineScanner = new LineScanner "## this is a multiline comment without a defined ending"
      result = lineScanner.skippedMultiComments()

      it 'sets the current state of the mulitline comment of the scanner to be
          true', ->
        expect(lineScanner.currentState.multiline.comment).to.be.true

      it 'increments the scanner position to the end of the line', ->
        expect(lineScanner.position).to.equal 55

      it 'returns true since a part of a comment was skipped', ->
        expect(result).to.be.true

    context 'when the scanner is in the middle of a multiline comment', ->
      currentScannerState = multiline: comment: true
      lineScanner = new LineScanner 'this is the continuation of a multiline
                                     comment begun elsewhere ##'
                                    , currentScannerState
      result = lineScanner.skippedMultiComments()

      it 'toggles the current state of the multiline comment of the scanner back
          to false', ->
        expect(lineScanner.currentState.multiline.comment).to.be.false

      it 'increments the scanner position to just after the comment', ->
        expect(lineScanner.position).to.equal 66

      it 'returns true since part of a comment was skipped', ->
        expect(result).to.be.true

    context 'when there is a multiline comment with a defined ending', ->
      lineScanner = new LineScanner "## this is a multiline comment with a defined ending ## f := 5"
      result = lineScanner.skippedMultiComments()

      it 'toggles the current state of the multiline comment of the scanner back to false', ->
        expect(lineScanner.currentState.multiline.comment).to.be.false

      it 'increments the scanner position to just after the comment', ->
        expect(lineScanner.position).to.equal 55

      it 'returns true since a comment was skipped', ->
        expect(result).to.be.true

    context 'when there is not a multiline comment and the scanner
             is not in the middle of scanning a multiline comment', ->
      lineScanner = new LineScanner "This is just a regular line with no comments"
      result = lineScanner.skippedMultiComments()

      it 'does not increment the scanner position', ->
        expect(lineScanner.position).to.equal 0

      it 'returns false since no comment or part of a comment was skipped', ->
        expect(result).to.be.false


  describe '#skippedSingleComments', ->

    context 'when there is a single line comment (single hash symbol)', ->
      lineScanner = new LineScanner "# this is a single line comment "
      result = lineScanner.skippedSingleComments()

      it 'increments the scanner position to the end of the line', ->
        expect(lineScanner.position).to.equal 32

      it 'returns true since a single line comment was skipped', ->
        expect(result).to.be.true

    context 'when a line does not being with a hash symbol (#)', ->
      lineScanner = new LineScanner "x := 5"
      result = lineScanner.skippedSingleComments()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'returns false since a single line comment was not skipped', ->
        expect(result).to.be.false


  describe '#extractedStringLiterals', ->

    context 'when the next token is a string without a defined ending', ->
      lineScanner = new LineScanner "'this is a multiline string without a
                                     defined ending"
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
      lineScanner = new LineScanner "this is the continuation of a multiline
                                     string begun elsewhere '"
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
            lexeme: "this is the continuation of a multiline string begun
                     elsewhere '"
          }]

      it 'returns true since part of a multiline string was extracted', ->
        expect(result).to.be.true

    context 'when there is a multiline string with a defined ending', ->
      lineScanner = new LineScanner "'this is a multiline string with a defined ending 'f := 5"
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
              lexeme: "'this is a multiline string with a defined ending '"
            }]

      it 'returns true since part of a multiline string was extracted', ->
        expect(result).to.be.true


  describe '#extractedWords', ->

    context 'when a reserved word is the next token', ->
      lineScanner = new LineScanner "bool ="
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
      lineScanner = new LineScanner "myVariable := () ->"
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
      lineScanner = new LineScanner "* 5"
      extractionResult = lineScanner.extractedWords()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'does not add anything to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql []

      it 'returns false since it could not extract a word', ->
        expect(extractionResult).to.be.false


  describe '#extractedOneCharacterTokens', ->

    context 'when a one-character token is the next token', ->
      lineScanner = new LineScanner "*5"
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
      lineScanner = new LineScanner " x"
      extractionResult = lineScanner.extractedOneCharacterTokens()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'does not add anything to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql []

      it 'returns false since a one-character token was not extracted', ->
        expect(extractionResult).to.be.false


  describe '#extractedTwoCharacterTokens', ->

    context 'when a two-character token is the next token', ->
      lineScanner = new LineScanner "<="
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
      lineScanner = new LineScanner "."
      extractionResult = lineScanner.extractedTwoCharacterTokens()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'does not add anything to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql []

      it 'returns false since a two-character token was not extracted', ->
        expect(extractionResult).to.be.false


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

    context 'when a numeric literal is not the next token', ->
      lineScanner = new LineScanner "abc.1234"
      extractionResult = lineScanner.extractedNumericLiterals()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'does not add anything to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql []

      it 'returns false since no numeric literal was extracted', ->
        expect(extractionResult).to.be.false
