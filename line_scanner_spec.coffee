sinon = require 'sinon'
chai = require 'chai'
sinonChai = require 'sinon-chai'
expect = chai.expect
chai.use(sinonChai)
LineScanner = require './line_scanner'


describe 'LineScanner', ->

  describe '#scan', ->
    context 'when the line is empty', ->
      lineScanner = new LineScanner ""
      lineScanner.extractTwoCharacterTokens = sinon.stub()
      lineScanner.extractOneCharacterTokens = sinon.stub()
      lineScanner.extractWords = sinon.stub()
      lineScanner.extractNumericLiterals = sinon.stub()
      lineScanner.scan()

      it 'returns without trying to extract any tokens', ->
        expect(lineScanner.extractTwoCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractOneCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractWords).to.not.have.been.called
        expect(lineScanner.extractNumericLiterals).to.not.have.been.called

    context 'when the line is full of spaces', ->
      lineScanner = new LineScanner "                    "
      lineScanner.extractTwoCharacterTokens = sinon.stub()
      lineScanner.extractOneCharacterTokens = sinon.stub()
      lineScanner.extractWords = sinon.stub()
      lineScanner.extractNumericLiterals = sinon.stub()
      lineScanner.scan()

      it 'returns without trying to extract any tokens', ->
        expect(lineScanner.extractTwoCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractOneCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractWords).to.not.have.been.called
        expect(lineScanner.extractNumericLiterals).to.not.have.been.called

    context 'when the line is commented out', ->
      lineScanner = new LineScanner "# example commented out line"
      lineScanner.extractTwoCharacterTokens = sinon.stub()
      lineScanner.extractOneCharacterTokens = sinon.stub()
      lineScanner.extractWords = sinon.stub()
      lineScanner.extractNumericLiterals = sinon.stub()
      lineScanner.scan()

      it 'returns without trying to extract any tokens', ->
        expect(lineScanner.extractTwoCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractOneCharacterTokens).to.not.have.been.called
        expect(lineScanner.extractWords).to.not.have.been.called
        expect(lineScanner.extractNumericLiterals).to.not.have.been.called



  describe '#skipSpaces', ->

    context 'when spaces are the next characters', ->
      lineScanner = new LineScanner "        x := 5"
      lineScanner.skipSpaces()

      it 'increments the scanner position to the first non-space character', ->
        expect(lineScanner.position).to.equal 8

    context 'when spaces are not the next characters', ->
      lineScanner = new LineScanner "x := 5"
      lineScanner.skipSpaces()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0


  describe '#skipComments', ->

    context 'when a line begins with a hash symbol (#)', ->
      lineScanner = new LineScanner "# this is a comment "
      lineScanner.skipComments()

      it 'increments the scanner position to the end of the line', ->
        expect(lineScanner.position).to.equal 20

    context 'when a line does not being with a hash symbol (#)', ->
      lineScanner = new LineScanner "x := 5"
      lineScanner.skipComments()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

  
  describe '#extractWords', ->
    
    context 'when a reserved word is the next token', ->
      lineScanner = new LineScanner "bool ="
      extractionResult = lineScanner.extractWords()
      
      it 'accurately increments the current position of the scanner', ->
        expect(lineScanner.position).to.equal 4
      
      it 'adds the reserved word to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql [{kind: 'bool', lexeme: 'bool', start: 0}]

      it 'returns true since it was successful in extracting a word', ->
        expect(extractionResult).to.be.true

    context 'when an identifer is the next token', ->
      lineScanner = new LineScanner "myVariable := () ->"
      extractionResult = lineScanner.extractWords()

      it 'accurately increments the current position of the scanner', ->
        expect(lineScanner.position).to.equal 10

      it 'adds the identifer to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql [{kind: 'ID', lexeme: 'myVariable', start: 0}]

      it 'returns true since it was successful in extracting a word', ->
        expect(extractionResult).to.be.true

    context 'when a word is not the next token', ->
      lineScanner = new LineScanner "* 5"
      extractionResult = lineScanner.extractWords()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'does not add anything to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql []

      it 'returns false since it could not extract a word', ->
        expect(extractionResult).to.be.false


  describe '#extractOneCharacterTokens', ->

    context 'when a one-character token is the next token', ->
      lineScanner = new LineScanner "*5"
      extractionResult = lineScanner.extractOneCharacterTokens()

      it 'accurately increments the current position of the scanner', ->
        expect(lineScanner.position).to.equal 1

      it 'adds the one-character token to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql [{kind: '*', lexeme: '*', start: 0}]

      it 'returns true since a one-character token was successfully extracted', ->
        expect(extractionResult).to.be.true

    context 'when a one-character token is not the next token', ->
      lineScanner = new LineScanner " x"
      extractionResult = lineScanner.extractOneCharacterTokens()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'does not add anything to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql []

      it 'returns false since a one-character token was not extracted', ->
        expect(extractionResult).to.be.false


  describe '#extractTwoCharacterTokens', ->

    context 'when a two-character token is the next token', ->
      lineScanner = new LineScanner "<="
      extractionResult = lineScanner.extractTwoCharacterTokens()

      it 'accurately increments the current position of the scanner', ->
        expect(lineScanner.position).to.equal 2

      it 'adds the two-character token to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql [{kind: '<=', lexeme: '<=', start: 0}]

      it 'returns true since a two-character token was successfully extracted', ->
        expect(extractionResult).to.be.true

    context 'when a two-character token is not the next token', ->
      lineScanner = new LineScanner "."
      extractionResult = lineScanner.extractTwoCharacterTokens()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'does not add anything to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql []

      it 'returns false since a two-character token was not extracted', ->
        expect(extractionResult).to.be.false

  describe '#extractNumericLiterals', ->

    context 'when a integer literal is the next token', ->
      lineScanner = new LineScanner "23456"
      extractionResult = lineScanner.extractNumericLiterals()

      it 'accurately increments the current position of the scanner', ->
        expect(lineScanner.position).to.equal 5

      it 'adds the integer literal to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql [{kind: 'INTLIT', lexeme: '23456', start: 0}]

      it 'returns true since a numeric literal was extracted', ->
        expect(extractionResult).to.be.true

    context 'when a float literal is the next token', ->
      lineScanner = new LineScanner "123.456"
      extractionResult = lineScanner.extractNumericLiterals()

      it 'accurately increments the current position of the scanner', ->
        expect(lineScanner.position).to.equal 7

      it 'adds the integer literal to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql [{kind: 'FLOATLIT', lexeme: '123.456', start: 0}]

      it 'returns true since a numeric literal was extracted', ->
        expect(extractionResult).to.be.true

    context 'when a numeric literal is not the next token', ->
      lineScanner = new LineScanner "abc"
      extractionResult = lineScanner.extractNumericLiterals()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'does not add anything to the line tokens', ->
        expect(lineScanner.lineTokens).to.eql []

      it 'returns false since no numeric literal was extracted', ->
        expect(extractionResult).to.be.false