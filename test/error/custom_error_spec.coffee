chai = require 'chai'
expect = chai.expect
CustomError = require '../../error/custom_error'


describe 'CustomError', ->

  describe '#constructor', ->
    context 'given a line number and error message', ->
      CustomError customError = new CustomError 'this is an example error', 2
      it 'constructs a new custom error', ->
        expect(customError).to.be.instanceOf(CustomError)

  describe '#getMessage', ->
    context 'when a CustomError was properly constructed
             with an error message and line number', ->
      CustomError customError = new CustomError 'this is an example error', 2

      it 'returns a message containing both the
          error message and line number', ->
        expect(customError.getMessage()).to
          .eql 'line 2: this is an example error'
