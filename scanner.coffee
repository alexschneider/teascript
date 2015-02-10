fs = require 'fs'
byline = require 'byline'
LineScanner = require './tools/line_scanner'

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
    lineNumber++
    line = stream.read()
    lineScanner = new LineScanner line, currentScannerState
    {errors, lineTokens, currentState} = lineScanner.scan()
    # TODO better error handling
    console.log "error happended on line #{lineNumber}" if errors

    allTokens = allTokens.concat lineTokens
    currentScannerState = currentState

  stream.once 'end', ->
    allTokens.push {kind: 'EOF', lexeme: 'EOF', start: 0}
    callback allTokens
