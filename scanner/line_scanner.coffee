tokens = require './tokens'

class LineScanner
  constructor: (@line, @currentState, @lineNumber) ->
    @currentState ?=
      multiline:
        comment: false
        string: false
    @start = 0
    @position = 0
    @lineTokens = []

  scan: ->
    return {lineError: null, @lineTokens, @currentState} unless @line

    tokensInLine = false

    while @position < @line.length
      # continue iterating over the line of characters
      # if we've been able to do one of the following:
      # 1. skip one or more insignificant characters (white space, comment, etc)
      # 2. extract a valid teascript token
      continue if @skippedSpaces()
      continue if @skippedMultiComments()
      continue if @skippedSingleComments()
      tokensInLine = true
      continue if @extractedNumericLiterals()
      continue if @extractedTwoCharacterTokens()
      continue if @extractedOneCharacterTokens()
      continue if @extractedWords()
      continue if @extractedStringLiterals()

      # return an error if we were not able to either extract
      # something from or skip the current character
      return {
        lineError: "invalid token at position #{@position}",
        lineTokens: []
      }

    @addToken {kind: 'newline'} if tokensInLine
    return {lineError: null, @lineTokens, @currentState}

  addToken: ({kind, lexeme}) ->
    lexeme ?= kind
    token = {lexeme, kind, @start}
    token.lineNumber = @lineNumber if @lineNumber?
    @lineTokens.push token
    @lineTokens

  skippedSpaces: ->
    skippedSpaces = false
    if /\s/.test @line[@position]
      @position++ and @start++ while /\s/.test @line[@position]
      skippedSpaces = true
    skippedSpaces

  skippedSingleComments: ->
    skippedSingleComments = false
    if @line[@position] is '#'
      @position = @line.length
      skippedSingleComments = true
    skippedSingleComments

  skippedMultiComments: ->
    skippedMultiComments = false
    if @currentState.multiline.comment
      @lookForMultiCommentEnd()
      skippedMultiComments = true
    else if @line[@position..@position + 1] is '##'
      @position += 2
      @currentState.multiline.comment = true
      @lookForMultiCommentEnd()
      skippedMultiComments = true
    skippedMultiComments

  lookForMultiCommentEnd: ->
    relativePositionOfTrailingHashes = @line[@position..].indexOf '##'
    if relativePositionOfTrailingHashes >= 0
      # we have found the trailing hashes
      @position += relativePositionOfTrailingHashes + 2
      @currentState.multiline.comment = false
    else
      # no trailing hashes
      @position = @line.length

  extractedTwoCharacterTokens: ->
    @start = @position
    if @line[@position...@position + 2] in tokens.twoCharacterTokens
      @addToken {kind: @line[@position...@position + 2]}
      @position += 2
      return true
    return false

  extractedOneCharacterTokens: ->
    @start = @position
    if @line[@position] in tokens.oneCharacterTokens
      @addToken {kind: @line[@position]}
      @position++
      return true
    return false

  extractedStringLiterals: ->
    if @currentState.multiline.string
      @extractMultilineString()
      return true
    else if /\"|\'/.test @line[@position]
      @position++
      # strings multiline by default
      @currentState.multiline.string = true
      @extractMultilineString()
      return true
    else
      return false

  extractMultilineString: ->
    stringGroup = /([^'"\\]|\\['"\\rn])*("|')/.exec @line[@position..]

    if stringGroup
      # found trailing quote
      @currentState.multiline.string = false
      @position += stringGroup[0].length
      @addToken {kind: 'STRLIT', lexeme: @line[@start...@position]}
    else
      # no trailing quote found
      @position = @line.length

  extractedWords: ->
    @start = @position
    if /[a-zA-Z]/.test @line[@position]
      @position++ while /\w/.test(@line[@position]) and @position < @line.length
      @addWord @line[@start...@position]
      return true
    return false

  addWord: (word) ->
    if word in tokens.reservedWords
      @addToken {kind: word}
    else
      @addToken {kind: 'ID', lexeme: word}

  extractedNumericLiterals: ->
    @start = @position
    if /\d/.test @line[@position]
      numberGroups = /(\d*)(\.\d+)?/.exec @line[@position..]
      # if we grouped anything in the second group
      # (numbers after the decimal point), then it is a floatlit
      # if we didn't, it is a intlit
      kind = if numberGroups[2] then 'FLOATLIT' else 'INTLIT'
      @addToken {kind, lexeme: numberGroups[0]}
      @position += numberGroups[0].length
      return true
    return false

module.exports = LineScanner
