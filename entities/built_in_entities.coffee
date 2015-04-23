Type = require './type'

class BuiltInEntities
  @entities =
    out:
      value:
        params: [value: token: 'str']
        type: Type.FUNC
      type: Type.FUNC

    times:
      value:
        params: [
          { value: token: Type.FUNC }
          { value: token: Type.INT }
          { value: token: 'str' }
        ]
        type: Type.FUNC
      type: Type.FUNC

    sqrt:
      value:
        params: [value: token: 'str']
        type: Type.FUNC
      type: Type.FUNC

  @OutCode: (args) ->  # Make this a property of 'out' object above
    "console.log( #{args} );"

  @TimesCode: (args) ->
    numberOfCalls = args[2]
    result = ""
    i = 0
    while i < numberOfCalls
      result += "#{args[0]} ("
      i++
    result += "#{args[1]}"
    j = 0
    while j < numberOfCalls
      result += " )"
      j++
    result += ";"

  @SqrtCode: (args) ->
    "Math.sqrt( #{args} );"


module.exports = BuiltInEntities
