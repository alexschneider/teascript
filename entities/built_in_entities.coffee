Type = require './type'

class BuiltInEntities
  @entities =
    out:
      value:
        params: [value: token: 'str']
        type: Type.FUNC
      type: Type.FUNC

module.exports = BuiltInEntities