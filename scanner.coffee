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
    console.log "error happended on line #{lineNumber}" if errors
    # TODO better error handling

    allTokens = allTokens.concat lineTokens

    # update the current state of the scanner
    currentScannerState = currentState

  stream.once 'end', ->
    # TODO: consider pushing some kind of an EOF token here?
    callback allTokens
