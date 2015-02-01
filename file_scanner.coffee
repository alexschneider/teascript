LineByLineReader = require 'line-by-line'
LineScanner = require './line_scanner'

module.exports = (filePath, callback) ->
  reader = new LineByLineReader filePath

  allTokens = []
  lineNumber = 0
  
  reader.on 'error', (error) ->
    # TODO handle error stuff 

  reader.on 'line', (line) ->
    lineScanner = new LineScanner line
    {errors, lineTokens} = lineScanner.scan()
    return CustomErrorHandler(errors, lineNumber) if errors
    allTokens.push lineTokens

  reader.once 'end', ->
    console.log JSON.stringify(tokens)
    # push some kind of an EOF token here? 
    callback tokens

