class CustomError
  constructor: (@message, @lineNumber) ->

  getMessage: ->
    "line #{@lineNumber}: #{@message}"

module.exports = CustomError