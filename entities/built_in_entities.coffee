Type = require './type'

class BuiltInEntities
  @entities =
    out:
      code: 
        (@args) -> 'console.log(' + @args +   ')'
      value:
        params: [value: token: 'str']
        type: Type.FUNC
      type: Type.FUNC
      

module.exports = BuiltInEntities