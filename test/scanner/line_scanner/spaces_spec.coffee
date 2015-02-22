chai = require 'chai'
expect = chai.expect
LineScanner = require '../../../scanner/line_scanner'

describe 'LineScanner', ->
  describe 'Skipping Spaces', ->

    describe '#skippedSpaces', ->

      context 'when spaces are the next characters', ->
        lineScanner = new LineScanner '        x := 5'
        result = lineScanner.skippedSpaces()

        it 'increments the scanner position to the
            first non-space character', ->
          expect(lineScanner.position).to.equal 8

        it 'returns true since one or more spaces were skipped', ->
          expect(result).to.be.true

      context 'when a tab is the next character', ->
        lineScanner = new LineScanner '\t'
        result = lineScanner.skippedSpaces()

        it 'increments the scanner position to after
            the escaped tab character', ->
          expect(lineScanner.position).to.equal 1

        it 'returns true since white space was skipped
           (even though it was in the form of a tab)', ->
          expect(result).to.be.true

      context 'when spaces are not the next characters', ->
        lineScanner = new LineScanner 'x := 5'
        result = lineScanner.skippedSpaces()

        it 'does not increment the current position of the scanner', ->
          expect(lineScanner.position).to.equal 0

        it 'returns false since no spaces were skipped', ->
          expect(result).to.be.false
