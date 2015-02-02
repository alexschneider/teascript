tokens = require './tokens'

class LineScanner
  constructor: (@line) ->
    @start = 0
    @position = 0
    @lineTokens = []

  scan: ->
    return unless @line

    while @position < @line.length

      @skipSpaces()
      @skipComments()
      break unless @position < @line.length

      # continue to next iteration of while loop
      # once we've been able to extract a token
      continue if @extractTwoCharacterTokens()
      continue if @extractOneCharacterTokens()
      continue if @extractWords()
      continue if @extractNumericLiterals()

      # return an error if we were not able to 
      # extract any tokens from the line
      return {errors: "invalid token bro"}

    return {@lineTokens}

  addToken: ({kind, lexeme}) ->
    lexeme ?= kind
    @lineTokens.push {lexeme, kind, @start}

  skipSpaces: ->
    @position++ and @start++ while /\s/.test @line[@position]

  skipComments: ->
    if @line[@position] is '#'
      # move scanner position to end of line
      @position = @line.length

  extractTwoCharacterTokens: ->
    @start = @position
    if @line[@position...@position+2] in tokens.twoCharacterTokens
      @addToken {kind: @line[@position...@position+2]}
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


module.exports = LineScanner