class EntityUtilities

  @findLocation: (parsedToken) ->
    parsedToken = JSON.parse(JSON.stringify parsedToken)
    for k, v of parsedToken
      if typeof v is 'object'
        return @findLocation v
      else if k is 'lineNumber'
        return v

module.exports = EntityUtilities