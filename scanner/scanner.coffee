fs = require 'fs'
byline = require 'byline'
LineScanner = require './line_scanner'
CustomError = require '../error/custom_error'

module.exports = (filePath, callback) ->
  baseStream = fs.createReadStream filePath, {encoding: 'utf8'}
  baseStream.on 'error', (err) -> return callback err
  stream = byline baseStream, {keepEmptyLines: true}
  allTokens = []
  currentScannerState =
    multiline:
      comment: false
      string: false
    string:
      doubleQuote: false
  lineNumber = 1
  isValid = true
  scanningError = null

  stream.on 'readable', ->
    lineScanner = new LineScanner stream.read(), currentScannerState, lineNumber
    {lineError, lineTokens, currentState} = lineScanner.scan()

    if lineError
      scanningError = new CustomError(lineError, lineNumber).getMessage()
      baseStream.close()

    lineNumber++
    allTokens.push.apply allTokens, lineTokens
    currentScannerState = currentState

  stream.once 'end', ->
    allTokens.push {kind: 'EOF', lexeme: 'EOF', start: 0}
    callback scanningError, allTokens
