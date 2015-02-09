tokens = require './tokens'

class LineScanner
  constructor: (@line, @currentState) ->
    @currentState ?=
      multiline:
        comment: false
        string: false
    @start = 0
    @position = 0
    @lineTokens = []

  scan: ->

    return unless @line

    while @position < @line.length

      # continue iterating over the line of characters
      # if we've been able to do one of the following:
      # 1. skip insignificant characters (white space, comments, etc.)
      # 2. extract a valid token
      continue if @skippedSpaces()
      continue if @skippedMultiComments()
      continue if @skippedSingleComments()
      continue if @extractedTwoCharacterTokens()
      continue if @extractedOneCharacterTokens()
      continue if @extractedStringLiterals()
      continue if @extractedWords()
      continue if @extractedNumericLiterals()

      # return an error if we were not able to either extract
      # something from or skip the current character
      # TODO: BETTER ERROR HANDLING
      return {errors: "INVALID TOKEN"}

    # add newline token after each line
    @addToken {kind: 'newline'}
    return {@lineTokens, @currentState}

  addToken: ({kind, lexeme}) ->
    lexeme ?= kind
    @lineTokens.push {lexeme, kind, @start}

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
    relativePositionOfTrailingHashes = @line[@position..].indexOf "##"
    # we have found the trailing hashes
    if relativePositionOfTrailingHashes >= 0
      @position += relativePositionOfTrailingHashes + 2
      @currentState.multiline.comment = false
    # we have not yet found the trailing hashes
    else
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
    else if @line[@position] is ("'" or '"')
      @position++
      # strings multiline by default
      @currentState.multiline.string = true
      @extractMultilineString()
      return true
    else
      return false

  extractMultilineString: ->
    # TODO: IMPLEMENT SO THAT ESCAPED QUOTES AREN'T TREATED AS END OF STRING

    # search for trailing quote for end of multiline string
    @position++ while @line[@position] isnt ("'" or '"') and
                      @position < @line.length
    return unless @position < @line.length

    # found trailing quote
    @currentState.multiline.string = false
    @position++
    @addToken {kind: 'STRLIT', lexeme: @line[@start...@position]}

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
      numberGroups = /(\d*)\.?(\d*)/.exec @line[@position..]
      kind = if numberGroups[2] then 'FLOATLIT' else 'INTLIT'
      @addToken {kind, lexeme: numberGroups[0]}
      @position += numberGroups[0].length
      return true
    return false

module.exports = LineScanner
