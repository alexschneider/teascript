LineByLineReader = require 'line-by-line'
LineScanner = require './tools/line_scanner'

module.exports = (filePath, callback) ->
  reader = new LineByLineReader filePath, {encoding: 'utf8'}
  allTokens = []
  currentScannerState =
    multiline:
      comment: false
      string: false
  lineNumber = 0
  
  reader.on 'error', (error) ->
    # TODO handle error stuff

  reader.on 'line', (line) ->
    lineNumber++
    lineScanner = new LineScanner line, currentScannerState
    {errors, lineTokens, currentState} = lineScanner.scan()
    return callback CustomErrorHandler(errors, lineNumber) if errors
    # add the tokens of the line to all the tokens
    allTokens.push lineTokens
    # update the current state of the scanner
    currentScannerState = currentState

  reader.once 'end', ->
    console.log JSON.stringify(tokens)
    # push some kind of an EOF token here?
    callback tokens
