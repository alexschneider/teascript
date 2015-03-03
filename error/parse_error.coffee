class ParseError extends Error
  constructor: (errorList) ->
    @name = 'ParseError'
    @message = errorList?.reduce ((prev, cur) ->
      prev + cur.getMessage() + '\n\n'), ''

module.exports = ParseError
