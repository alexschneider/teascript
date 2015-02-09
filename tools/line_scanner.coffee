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
    
    # iterate through all characters in the line
    while @position < @line.length
      @skipSpaces()
      @skipComments()
      break unless @position < @line.length

      # continue to next iteration of while loop
      # once we've been able to extract a token
      continue if @extractTwoCharacterTokens()
      continue if @extractOneCharacterTokens()
      continue if @extractStringLiterals()
      continue if @extractWords()
      continue if @extractNumericLiterals()

      # return an error if we were not able to
      # extract any tokens from the line
      return {errors: 'invalid token bro'}
    
    # add newline token after each line
    @addToken {kind: 'newline'}
    return {@lineTokens, @currentState}

  addToken: ({kind, lexeme}) ->
    lexeme ?= kind
    @lineTokens.push {lexeme, kind, @start}

  skipSpaces: ->
    @position++ and @start++ while /\s/.test @line[@position]

  skipComments: ->
    if @currentState.multiline.comment
      @skipMultilineComment()
    else if @line[@position] is '#'
      if @line[@position + 1] is '#'
        @position += 2
        @currentState.multiline.comment = true
        @skipMultilineComment()
      else
        # skip rest of line for single line comment
        @position = @line.length
  
  skipMultilineComment: ->
    # search for trailing two hash symbols for end of multiline comment
    @position++ while @line[@position] isnt '#' and @position < @line.length
    return unless @position < @line.length

    # found trailing two hash symbols for end of multiline comment
    if @line[@position...@position + 2] is '##'
      @currentState.multiline.comment = false
      @position += 2

  extractTwoCharacterTokens: ->
    @start = @position
    if @line[@position...@position + 2] in tokens.twoCharacterTokens
      @addToken {kind: @line[@position...@position + 2]}
      @position += 2
      return true
    return false

  extractOneCharacterTokens: ->
    @start = @position
    if @line[@position] in tokens.oneCharacterTokens
      @addToken {kind: @line[@position]}
      @position++
      return true
    return false

  extractStringLiterals: ->
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
    # search for trailing quote for end of multiline string
    @position++ while @line[@position] isnt ("'" or '"') and
                      @position < @line.length
    return unless @position < @line.length

    # found trailing quote for end of multiline string (isn't an escaped quote)
    # TODO: implement ability to escape quote characters?
    if @line[@position] is ("'" or '"') and @line[@position - 1]
      @currentState.multiline.string = false
      @position++
      @addToken {kind: 'STRLIT', lexeme: @line[@start...@position]}

  extractWords: ->
    @start = @position
    if /[a-zA-Z]/.test @line[@position]
      @position++ while /\w/.test(@line[@position]) and @position < @line.length
      @addWord(word = @line[@start...@position])
      return true
    return false

  addWord: (word) ->
    if word in tokens.reservedWords
      @addToken {kind: word}
    else
      @addToken {kind: 'ID', lexeme: word}

  extractNumericLiterals: ->
    @start = @position
    if /\d/.test @line[@position]
      @extractNumberSequence()
      if @line[@position] is '.'
        @position++
        # get numbers after the decimal point
        @extractNumberSequence()
        @addToken {kind: 'FLOATLIT', lexeme: @line[@start...@position]}
      else
        @addToken {kind: 'INTLIT', lexeme: @line[@start...@position]}
      return true
    return false

  extractNumberSequence: ->
    @position++ while /\d/.test(@line[@position]) and @position < @line.length

module.exports = LineScanner
