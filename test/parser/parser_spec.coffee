chai = require 'chai'
expect = chai.expect

parse = require '../../parser'
outputTokens = require '../example/output_tokens'

describe 'Scanner', ->

  describe 'parsing valid teascript programs', ->
    describe 'valid teascript program #1', ->
      context "when test program1.tea's tokens
               are passed through the scanner", ->
