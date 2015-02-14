chai = require 'chai'
expect = chai.expect
LineScanner = require '../../../tools/line_scanner'

describe 'LineScanner', ->
  describe 'Skipping Comments', ->


    describe '#skippedMultiComments', ->

      context 'when a multiline comment without a defined
               ending is the next sequence of characters', ->
        lineScanner = new LineScanner '## this is a multiline comment
                                       without a defined ending'
        result = lineScanner.skippedMultiComments()

        it 'sets the current state of the mulitline
            comment of the scanner to be true', ->
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

        it 'toggles the current state of the multiline
            comment of the scanner back to false', ->
          expect(lineScanner.currentState.multiline.comment).to.be.false

        it 'increments the scanner position to just after the comment', ->
          expect(lineScanner.position).to.equal 66

        it 'returns true since part of a comment was skipped', ->
          expect(result).to.be.true

      context 'when there is a multiline comment with a defined ending', ->
        lineScanner =
          new LineScanner '## this is a multiline comment
                           with a defined ending ## f := 5'
        result = lineScanner.skippedMultiComments()

        it 'toggles the current state of the multiline comment
            of the scanner back to false', ->
          expect(lineScanner.currentState.multiline.comment).to.be.false

        it 'increments the scanner position to just after the comment', ->
          expect(lineScanner.position).to.equal 55

        it 'returns true since a comment was skipped', ->
          expect(result).to.be.true

      context 'when there is not a multiline comment nor is the scanner
               in the middle of scanning a multiline comment', ->
        lineScanner = new LineScanner 'This is just a regular
                                       line with no comments'
        result = lineScanner.skippedMultiComments()

        it 'does not increment the scanner position', ->
          expect(lineScanner.position).to.equal 0

        it 'returns false since no comment or part of a comment was skipped', ->
          expect(result).to.be.false


  describe '#skippedSingleComments', ->

    context 'when single line comment is the next sequence of characters', ->
      lineScanner = new LineScanner '# this is a single line comment '
      result = lineScanner.skippedSingleComments()

      it 'increments the scanner position to the end of the line', ->
        expect(lineScanner.position).to.equal 32

      it 'returns true since a single line comment was skipped', ->
        expect(result).to.be.true

    context 'when a single line comment is not
             the next sequence of characters', ->
      lineScanner = new LineScanner 'x := 5'
      result = lineScanner.skippedSingleComments()

      it 'does not increment the current position of the scanner', ->
        expect(lineScanner.position).to.equal 0

      it 'returns false since a single line comment was not skipped', ->
        expect(result).to.be.false
