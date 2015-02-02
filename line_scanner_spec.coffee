chai = require 'chai'
expect = chai.expect
LineScanner = require './line_scanner'


describe 'LineScanner', ->


  describe '#skipSpaces', ->
    
    context 'when spaces are not the next characters', ->
      lineScanner = new LineScanner "x := 5"
      lineScanner.skipSpaces()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

    context 'when spaces are the next characters', ->
      lineScanner = new LineScanner "        x := 5"
      lineScanner.skipSpaces()

      it 'increments the scanner position to the first non-space character', ->
        expect(lineScanner.position).to.equal 8

  
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
