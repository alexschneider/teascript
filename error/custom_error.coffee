class CustomError extends Error
  constructor: (message, lineNumber) ->
    @name = 'Custom Error'
    @message = "line #{lineNumber}: #{message}"

  getMessage: ->
    @message

module.exports = CustomError
