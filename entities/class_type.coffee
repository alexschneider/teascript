Type = require './type'

class ClassType extends Type

  constructor: (@name, @fields) ->
    super @name

module.exports = ClassType