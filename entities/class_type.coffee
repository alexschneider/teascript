Type = require './type'

class ClassType extends Type
  constructor: (@name, @type) ->
    super @name

module.exports = ClassType