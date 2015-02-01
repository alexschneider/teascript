class LineScanner
  
  constructor: (@line) ->
    @position = 0
    @lineTokens = []

  scan: ->
    return unless @line
    while @position < @line.length
      @skipSpaces()
      continue if @checkForComment()
      continue if @checkForTwoCharacterTokens()
      continue if @checkForOneCharacterTokens()
      continue if @checkForReservedWords()
      continue if @checkForNumericLiterals()
      return {errors: "invalid token bro"}
    return {@lineTokens}

  addToken: ->
    @lineTokens.push {position, kind, lexeme: lexeme or kind}

  skipSpaces: ->
    @position++ while /\s/.test line[@position]

  checkForTwoCharacterTokens: ->
    if /<=|>=/.test line[@position...@position+2]
      addToken line[@position...@position+2]
      @position += 2
      return true
    return false


module.exports = LineScanner