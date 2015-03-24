class ParseError extends Error
  constructor: (errorList) ->
    @name = 'ParseError'
    @message = errorList?.reduce ((prev, cur) ->
      prev + cur.getMessage() + '\n '), ''

module.exports = ParseError
