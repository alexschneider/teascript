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
    # console.log "lineResults #{JSON.stringify lineResults}"


    console.log "error happended on line #{lineNumber}" if errors
    # return callback CustomErrorHandler(errors, lineNumber) if errors
    # add the tokens of the line to all the tokens
    console.log "LINE TOKENS: #{JSON.stringify lineTokens}"
    allTokens = allTokens.concat(lineTokens)
    console.log "ALL TOKENS #{JSON.stringify allTokens}"
    # update the current state of the scanner
    currentScannerState = currentState

  stream.once 'end', ->
    # console.log JSON.stringify(allTokens)
    # push some kind of an EOF token here?
    callback allTokens
