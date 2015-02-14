fs = require 'fs'
byline = require 'byline'
LineScanner = require './tools/line_scanner'
CustomError = require './custom_error'

module.exports = (filePath, callback) ->
  baseStream = fs.createReadStream filePath, {encoding: 'utf8'}
  baseStream.on 'error', (err) -> return callback err
  stream = byline baseStream, {keepEmptyLines: true}
  allTokens = []
  currentScannerState =
    multiline:
      comment: false
      string: false
  lineNumber = 0
  isValid = true

  stream.on 'readable', ->
    lineScanner = new LineScanner stream.read(), currentScannerState, lineNumber
    {error, lineTokens, currentState} = lineScanner.scan()
    if error
      isValid = false
      return callback (new CustomError(error, lineNumber)).getMessage()
    lineNumber++
    allTokens = allTokens.concat lineTokens
    currentScannerState = currentState

  stream.once 'end', ->
    allTokens.push {kind: 'EOF', lexeme: 'EOF', start: 0}
    # don't include preceding newline character
    callback null, allTokens[1..] if isValid
