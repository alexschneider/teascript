fs = require 'fs'
byline = require 'byline'
LineScanner = require './tools/line_scanner'
CustomError = require './custom_error'

module.exports = (filePath, callback) ->
  baseStream = fs.createReadStream filePath, {encoding: 'utf8'}
  baseStream.on 'error', (err) -> console.log err
  stream = byline baseStream, {keepEmptyLines: true}
  allTokens = []
  currentScannerState =
    multiline:
      comment: false
      string: false
  lineNumber = 0

  stream.on 'readable', ->
    lineScanner = new LineScanner stream.read(), currentScannerState
    {error, lineTokens, currentState} = lineScanner.scan()
    if error
      console.log (new CustomError(error, lineNumber)).getMessage()
      return
    lineNumber++
    allTokens = allTokens.concat lineTokens
    currentScannerState = currentState

  stream.once 'end', ->
    allTokens.push {kind: 'EOF', lexeme: 'EOF', start: 0}
    callback allTokens[1..] # don't include preceding newline character
