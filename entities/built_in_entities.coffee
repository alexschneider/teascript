Type = require './type'

class BuiltInEntities
  @entities =
    out:
      value:
        params: [value: token: 'str']
        type: Type.FUNC
      type: Type.FUNC
  @OutCode: (args) ->  # Make this a property of out object above
      'console.log(' + args + ');'

module.exports = BuiltInEntities