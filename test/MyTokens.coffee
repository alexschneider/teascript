class MyTokens
  @tokens1 =
    [
      {kind: 'ID', lexeme:'x', start: 0},
      {kind: ':=', lexeme:':=',start: 2},
      {kind: 'INTLIT', lexeme:'2', start: 5},
      {kind: '*', lexeme:'*', start: 7},
      {kind: 'INTLIT', lexeme:'3', start: 9},
      {kind: 'newline', lexeme: 'newline', start: 10},

      {kind: 'ID', lexeme: 'y', start: 0},
      {kind: ':=', lexeme: ':=', start: 2},
      {kind: 'INTLIT', lexeme: '8', start: 5},
      {kind: '/', lexeme: '/', start: 7},
      {kind: 'INTLIT', lexeme: '4', start: 9},
      {kind: 'newline', lexeme: 'newline', start: 10},

      {kind: 'ID', lexeme: 'x', start: 0},
      {kind: '=', lexeme: '=', start: 2},
      {kind: 'ID', lexeme: 'x', start: 4},
      {kind: '*', lexeme: '*', start: 6},
      {kind: 'ID', lexeme: 'y', start: 8},
      {kind: 'newline', lexeme: 'newline', start: 9},

      {kind: 'ID', lexeme: 'newFunc', start: 0},
      {kind: ':=', lexeme: ':=', start: 8},
      {kind: '(', lexeme: '(', start: 11},
      {kind: 'ID', lexeme: 'x', start: 12},
      {kind: ',', lexeme: ',', start: 13},
      {kind: 'ID', lexeme: 'y', start: 15},
      {kind: ')', lexeme: ')', start: 16},
      {kind: '->', lexeme: '->', start: 18},

      {kind: 'newline', lexeme: 'newline', start: 20},
      {kind: 'return', lexeme: 'return', start: 4},
      {kind: 'ID', lexeme: 'x', start: 11},
      {kind: 'if', lexeme: 'if', start: 13},
      {kind: 'ID', lexeme: 'x', start: 16},
      {kind: '>=', lexeme: '>=', start: 18},
      {kind: 'ID', lexeme: 'y', start: 21},
      {kind: 'else', lexeme: 'else', start: 23},
      {kind: 'true', lexeme: 'true', start: 28},
      {kind: 'newline', lexeme: 'newline', start: 32},
      {kind: 'end', lexeme: 'end', start: 0},
      {kind: 'newline', lexeme: 'newline', start: 3}
    ]

module.exports = MyTokens