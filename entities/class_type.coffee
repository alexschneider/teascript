Type = require './type'

class ClassType extends Type
  constructor: (@name, @classDef) ->
    super @name

module.exports = ClassType