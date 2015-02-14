class MyTokens
  @program1_tokens = [
    { lexeme: 'x', kind: 'ID', start: 0, lineNumber: 0 },
    { lexeme: ':=', kind: ':=', start: 2, lineNumber: 0 },
    { lexeme: '2', kind: 'INTLIT', start: 5, lineNumber: 0 },
    { lexeme: '*', kind: '*', start: 7, lineNumber: 0 },
    { lexeme: '3', kind: 'INTLIT', start: 9, lineNumber: 0 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 1 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 5 },
    { lexeme: 'y', kind: 'ID', start: 0, lineNumber: 5 },
    { lexeme: ':=', kind: ':=', start: 2, lineNumber: 5 },
    { lexeme: '8', kind: 'INTLIT', start: 5, lineNumber: 5 },
    { lexeme: '/', kind: '/', start: 7, lineNumber: 5 },
    { lexeme: '4', kind: 'INTLIT', start: 9, lineNumber: 5 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 7 },
    { lexeme: 'x', kind: 'ID', start: 0, lineNumber: 7 },
    { lexeme: '=', kind: '=', start: 2, lineNumber: 7 },
    { lexeme: 'x', kind: 'ID', start: 4, lineNumber: 7 },
    { lexeme: '*', kind: '*', start: 6, lineNumber: 7 },
    { lexeme: 'y', kind: 'ID', start: 8, lineNumber: 7 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 9 },
    { lexeme: 'newFunc', kind: 'ID', start: 0, lineNumber: 9 },
    { lexeme: ':=', kind: ':=', start: 8, lineNumber: 9 },
    { lexeme: '(', kind: '(', start: 11, lineNumber: 9 },
    { lexeme: 'x', kind: 'ID', start: 12, lineNumber: 9 },
    { lexeme: ',', kind: ',', start: 13, lineNumber: 9 },
    { lexeme: 'y', kind: 'ID', start: 15, lineNumber: 9 },
    { lexeme: ')', kind: ')', start: 16, lineNumber: 9 },
    { lexeme: '->', kind: '->', start: 18, lineNumber: 9 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 10 },
    { lexeme: 'return', kind: 'return', start: 4, lineNumber: 10 },
    { lexeme: 'x', kind: 'ID', start: 11, lineNumber: 10 },
    { lexeme: 'if', kind: 'if', start: 13, lineNumber: 10 },
    { lexeme: 'x', kind: 'ID', start: 16, lineNumber: 10 },
    { lexeme: '>=', kind: '>=', start: 18, lineNumber: 10 },
    { lexeme: 'y', kind: 'ID', start: 21, lineNumber: 10 },
    { lexeme: 'else', kind: 'else', start: 23, lineNumber: 10 },
    { lexeme: 'true', kind: 'true', start: 28, lineNumber: 10 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 11 },
    { lexeme: 'end', kind: 'end', start: 0, lineNumber: 11 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 13 },
    { lexeme: 'x', kind: 'ID', start: 0, lineNumber: 13 },
    { lexeme: ':=', kind: ':=', start: 2, lineNumber: 13 },
    { lexeme: '4', kind: 'INTLIT', start: 5, lineNumber: 13 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 14 },
    { lexeme: 'y', kind: 'ID', start: 0, lineNumber: 14 },
    { lexeme: ':=', kind: ':=', start: 2, lineNumber: 14 },
    { lexeme: '3.14', kind: 'FLOATLIT', start: 5, lineNumber: 14 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 15 },
    { lexeme: 'is_this_true', kind: 'ID', start: 0, lineNumber: 15 },
    { lexeme: '=', kind: '=', start: 13, lineNumber: 15 },
    { lexeme: 'false', kind: 'false', start: 15, lineNumber: 15 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 16 },
    { lexeme: 'z', kind: 'ID', start: 0, lineNumber: 16 },
    { lexeme: ':=', kind: ':=', start: 2, lineNumber: 16 },
    { lexeme: 'none', kind: 'none', start: 5, lineNumber: 16 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 18 },
    { lexeme: 'my_string', kind: 'ID', start: 0, lineNumber: 18 },
    { lexeme: ':=', kind: ':=', start: 10, lineNumber: 18 },
    {
      lexeme: '"Oh baby!"',
      kind: 'STRLIT',
      start: 13,
      lineNumber: 18
    },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 19 },
    { lexeme: 'my_list', kind: 'ID', start: 0, lineNumber: 19 },
    { lexeme: ':=', kind: ':=', start: 8, lineNumber: 19 },
    { lexeme: '[', kind: '[', start: 11, lineNumber: 19 },
    { lexeme: '1', kind: 'INTLIT', start: 12, lineNumber: 19 },
    { lexeme: '..', kind: '..', start: 13, lineNumber: 19 },
    { lexeme: '5', kind: 'INTLIT', start: 15, lineNumber: 19 },
    { lexeme: ']', kind: ']', start: 16, lineNumber: 19 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 20 },
    { lexeme: 'my_tuple', kind: 'ID', start: 0, lineNumber: 20 },
    { lexeme: ':=', kind: ':=', start: 9, lineNumber: 20 },
    { lexeme: '(', kind: '(', start: 12, lineNumber: 20 },
    { lexeme: '1', kind: 'INTLIT', start: 13, lineNumber: 20 },
    { lexeme: ',', kind: ',', start: 14, lineNumber: 20 },
    { lexeme: '2', kind: 'INTLIT', start: 15, lineNumber: 20 },
    { lexeme: ',', kind: ',', start: 16, lineNumber: 20 },
    { lexeme: '3', kind: 'INTLIT', start: 17, lineNumber: 20 },
    { lexeme: ',', kind: ',', start: 18, lineNumber: 20 },
    { lexeme: '2', kind: 'INTLIT', start: 19, lineNumber: 20 },
    { lexeme: ',', kind: ',', start: 20, lineNumber: 20 },
    { lexeme: '1', kind: 'INTLIT', start: 21, lineNumber: 20 },
    { lexeme: ')', kind: ')', start: 22, lineNumber: 20 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 21 },
    { lexeme: 'my_set', kind: 'ID', start: 0, lineNumber: 21 },
    { lexeme: ':=', kind: ':=', start: 7, lineNumber: 21 },
    { lexeme: '<', kind: '<', start: 10, lineNumber: 21 },
    { lexeme: '1', kind: 'INTLIT', start: 11, lineNumber: 21 },
    { lexeme: ',', kind: ',', start: 12, lineNumber: 21 },
    { lexeme: '3', kind: 'INTLIT', start: 13, lineNumber: 21 },
    { lexeme: ',', kind: ',', start: 14, lineNumber: 21 },
    { lexeme: '5', kind: 'INTLIT', start: 15, lineNumber: 21 },
    { lexeme: ',', kind: ',', start: 16, lineNumber: 21 },
    { lexeme: '7', kind: 'INTLIT', start: 17, lineNumber: 21 },
    { lexeme: '>', kind: '>', start: 18, lineNumber: 21 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 22 },
    { lexeme: 'my_map', kind: 'ID', start: 0, lineNumber: 22 },
    { lexeme: ':=', kind: ':=', start: 7, lineNumber: 22 },
    { lexeme: '{', kind: '{', start: 10, lineNumber: 22 },
    { lexeme: '"lat"', kind: 'STRLIT', start: 11, lineNumber: 22 },
    { lexeme: ':', kind: ':', start: 16, lineNumber: 22 },
    { lexeme: '51.24', kind: 'FLOATLIT', start: 17, lineNumber: 22 },
    { lexeme: ',', kind: ',', start: 22, lineNumber: 22 },
    { lexeme: '"long"', kind: 'STRLIT', start: 23, lineNumber: 22 },
    { lexeme: ':', kind: ':', start: 29, lineNumber: 22 },
    { lexeme: '0.18', kind: 'FLOATLIT', start: 30, lineNumber: 22 },
    { lexeme: '}', kind: '}', start: 34, lineNumber: 22 },
    { kind: 'EOF', lexeme: 'EOF', start: 0 }
  ]

  @program2_tokens = [
    { lexeme: 'x', kind: 'ID', start: 0, lineNumber: 0 },
    { lexeme: ':=', kind: ':=', start: 2, lineNumber: 0 },
    { lexeme: '2', kind: 'INTLIT', start: 5, lineNumber: 0 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 1 },
    { lexeme: 'x', kind: 'ID', start: 0, lineNumber: 1 },
    { lexeme: '++', kind: '++', start: 1, lineNumber: 1 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 2 },
    { lexeme: 'x', kind: 'ID', start: 0, lineNumber: 2 },
    { lexeme: '+=', kind: '+=', start: 2, lineNumber: 2 },
    { lexeme: '2', kind: 'INTLIT', start: 5, lineNumber: 2 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 4 },
    { lexeme: 'collatz', kind: 'ID', start: 0, lineNumber: 4 },
    { lexeme: ':=', kind: ':=', start: 8, lineNumber: 4 },
    { lexeme: '(', kind: '(', start: 11, lineNumber: 4 },
    { lexeme: 'x', kind: 'ID', start: 12, lineNumber: 4 },
    { lexeme: ')', kind: ')', start: 13, lineNumber: 4 },
    { lexeme: '->', kind: '->', start: 15, lineNumber: 4 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 5 },
    { lexeme: 'out', kind: 'ID', start: 4, lineNumber: 5 },
    { lexeme: '(', kind: '(', start: 7, lineNumber: 5 },
    { lexeme: 'x', kind: 'ID', start: 8, lineNumber: 5 },
    { lexeme: ')', kind: ')', start: 9, lineNumber: 5 },
    { lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 6 },
    { lexeme: 'return', kind: 'return', start: 4, lineNumber: 6 },
    { lexeme: 'x', kind: 'ID', start: 11, lineNumber: 6 },
    { lexeme: 'if', kind: 'if', start: 13, lineNumber: 6 },
    { lexeme: 'x', kind: 'ID', start: 16, lineNumber: 6 },
    { lexeme: 'is', kind: 'is', start: 18, lineNumber: 6 },
    { lexeme: '1', kind: 'INTLIT', start: 21, lineNumber: 6 },
    { lexeme: 'else', kind: 'else', start: 23, lineNumber: 6 },
    { lexeme: '(', kind: '(', start: 28, lineNumber: 6 },
    { lexeme: 'collatz', kind: 'ID', start: 30, lineNumber: 6 },
    { lexeme: '(', kind: '(', start: 37, lineNumber: 6 },
    { lexeme: 'x', kind: 'ID', start: 38, lineNumber: 6 },
    { lexeme: '/', kind: '/', start: 39, lineNumber: 6 },
    { lexeme: '2', kind: 'INTLIT', start: 40, lineNumber: 6 },
    { lexeme: ')', kind: ')', start: 41, lineNumber: 6 },
    { lexeme: 'if', kind: 'if', start: 43, lineNumber: 6 },
    { lexeme: 'x', kind: 'ID', start: 46, lineNumber: 6 },
    { lexeme: '%', kind: '%', start: 48, lineNumber: 6 },
    { lexeme: '2', kind: 'INTLIT', start: 50, lineNumber: 6 },
    { lexeme: 'is', kind: 'is', start: 52, lineNumber: 6 },
    { lexeme: '0', kind: 'INTLIT', start: 55, lineNumber: 6 },
    { lexeme: 'else', kind: 'else', start: 57, lineNumber: 6 },
    { lexeme: 'collatz', kind: 'ID', start: 62, lineNumber: 6 },
    { lexeme: '(', kind: '(', start: 69, lineNumber: 6 },
    { lexeme: '3', kind: 'INTLIT', start: 70, lineNumber: 6 },
    { lexeme: '*', kind: '*', start: 71, lineNumber: 6 },
    { lexeme: 'x', kind: 'ID', start: 72, lineNumber: 6 },
    { lexeme: '+', kind: '+', start: 73, lineNumber: 6 },
    { lexeme: '1', kind: 'INTLIT', start: 74, lineNumber: 6 },
    { lexeme: ')', kind: ')', start: 75, lineNumber: 6 },
    { lexeme: ')', kind: ')', start: 76, lineNumber: 6 },
    { kind: 'EOF', lexeme: 'EOF', start: 0 }
  ]

  @program3_tokens = [
    {kind:'ID', lexeme:'a', start:0},
    {kind:':=', lexeme:':=', start:2},
    {kind: 'INTLIT', lexeme:'4', start:5},
    {kind:'+', lexeme:'+', start:7},
    {kind:'INTLIT', lexeme:'5',  start: 9},
    {kind:'newline', lexeme:'newline', start:0},

    {kind:'ID', lexeme:'b', start:0},
    {kind:':=', lexeme:':=',  start:2},
    {kind:'INTLIT', lexeme:'3', start:5},
    {kind:'/', lexeme:'/', start:7},
    {kind:'INTLIT', lexeme:'2', start:9},
    {kind:'newline', lexeme:'newline', start:0}

    {kind:'for', lexeme:'for', start:0},
    {kind:'ID', lexeme:'a', start:4},
    {kind:'in', lexeme:'in', start:6},
    {kind:'ID', lexeme:'x', start:9},
    {kind:':', lexeme:':', start:10},
    {kind:'newline', lexeme:'newline', start:0},

    {kind:'ID', lexeme:'out', start:4},
    {kind:'(', lexeme:'(', start:7},
    {kind:'ID', lexeme:'a', start:8},
    {kind:')', lexeme:')', start:9},
    {kind:'newline', lexeme:'newline', start:0},

    {kind:'end', lexeme:'end', start:0},
    {kind:'EOF', lexeme:'EOF', start:0}
  ]

  @program4_tokens = [
    {lexeme: 'for', kind: 'for', start: 0},
    {lexeme: 'i', kind: 'ID', start: 4},
    {lexeme: 'in', kind: 'in', start: 6},
    {lexeme: '0', kind: 'INTLIT', start: 9},
    {lexeme: '..', kind: '..', start: 10},
    {lexeme: '5', kind: 'INTLIT', start: 12},
    {lexeme: ':', kind: ':', start: 13},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'out', kind: 'ID', start: 2},
    {lexeme: '(', kind: '(', start: 5},
    {lexeme: 'i', kind: 'ID', start: 6},
    {lexeme: ')', kind: ')', start: 7},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'end', kind: 'end', start: 0},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'for', kind: 'for', start: 0},
    {lexeme: 'i', kind: 'ID', start: 4},
    {lexeme: 'in', kind: 'in', start: 6},
    {lexeme: '0', kind: 'INTLIT', start: 9},
    {lexeme: '..', kind: '..', start: 10},
    {lexeme: '10', kind: 'INTLIT', start: 12},
    {lexeme: 'by', kind: 'by', start: 15},
    {lexeme: '2', kind: 'INTLIT', start: 18},
    {lexeme: ':', kind: ':', start: 19},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'out', kind: 'ID', start: 2},
    {lexeme: '(', kind: '(', start: 5},
    {lexeme: 'i', kind: 'ID', start: 6},
    {lexeme: ')', kind: ')', start: 7},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'end', kind: 'end', start: 0},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'for', kind: 'for', start: 0},
    {lexeme: 'i', kind: 'ID', start: 4},
    {lexeme: 'in', kind: 'in', start: 6},
    {lexeme: '\'xylophones\'', kind: 'STRLIT', start: 9},
    {lexeme: '[', kind: '[', start: 21},
    {lexeme: '3', kind: 'INTLIT', start: 22},
    {lexeme: '..', kind: '..', start: 23},
    {lexeme: '6', kind: 'INTLIT', start: 25},
    {lexeme: ']', kind: ']', start: 26},
    {lexeme: ':', kind: ':', start: 27},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'out', kind: 'ID', start: 2},
    {lexeme: '(', kind: '(', start: 5},
    {lexeme: 'i', kind: 'ID', start: 6},
    {lexeme: ')', kind: ')', start: 7},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'end', kind: 'end', start: 0},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'for', kind: 'for', start: 0},
    {lexeme: 'i', kind: 'ID', start: 4},
    {lexeme: 'in', kind: 'in', start: 6},
    {lexeme: '"xylophones"', kind: 'STRLIT', start: 9},
    {lexeme: '[', kind: '[', start: 21},
    {lexeme: '0', kind: 'INTLIT', start: 22},
    {lexeme: '..', kind: '..', start: 23},
    {lexeme: '5', kind: 'INTLIT', start: 25},
    {lexeme: 'by', kind: 'by', start: 27},
    {lexeme: '3', kind: 'INTLIT', start: 30},
    {lexeme: ']', kind: ']', start: 31},
    {lexeme: ':', kind: ':', start: 32},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'out', kind: 'ID', start: 2},
    {lexeme: '(', kind: '(', start: 5},
    {lexeme: 'i', kind: 'ID', start: 6},
    {lexeme: ')', kind: ')', start: 7},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'end', kind: 'end', start: 0},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'x', kind: 'ID', start: 0},
    {lexeme: ':=', kind: ':=', start: 2},
    {lexeme: '"xylophones"', kind: 'STRLIT', start: 5},
    {lexeme: '[', kind: '[', start: 17},
    {lexeme: '3', kind: 'INTLIT', start: 18},
    {lexeme: '..', kind: '..', start: 19},
    {lexeme: '6', kind: 'INTLIT', start: 21},
    {lexeme: ']', kind: ']', start: 22},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'y', kind: 'ID', start: 0},
    {lexeme: ':=', kind: ':=', start: 2},
    {lexeme: '[', kind: '[', start: 5},
    {lexeme: '1', kind: 'INTLIT', start: 6},
    {lexeme: ',', kind: ',', start: 7},
    {lexeme: '6', kind: 'INTLIT', start: 9},
    {lexeme: ',', kind: ',', start: 10},
    {lexeme: '3', kind: 'INTLIT', start: 12},
    {lexeme: ',', kind: ',', start: 13},
    {lexeme: '5', kind: 'INTLIT', start: 15},
    {lexeme: ',', kind: ',', start: 16},
    {lexeme: '8', kind: 'INTLIT', start: 18},
    {lexeme: ',', kind: ',', start: 19},
    {lexeme: '9', kind: 'INTLIT', start: 21},
    {lexeme: ']', kind: ']', start: 22},
    {lexeme: '[', kind: '[', start: 23},
    {lexeme: '1', kind: 'INTLIT', start: 24},
    {lexeme: '..', kind: '..', start: 25},
    {lexeme: '6', kind: 'INTLIT', start: 27},
    {lexeme: 'by', kind: 'by', start: 29},
    {lexeme: '2', kind: 'INTLIT', start: 32},
    {lexeme: ']', kind: ']', start: 33},
    {kind: 'EOF', lexeme: 'EOF', start: 0}
  ]

  @program5_tokens = [
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'print_fib', kind: 'ID', start: 0},
    {lexeme: ':=', kind: ':=', start: 10},
    {lexeme: '(', kind: '(', start: 13},
    {lexeme: 'max', kind: 'ID', start: 14},
    {lexeme: ')', kind: ')', start: 17},
    {lexeme: '->', kind: '->', start: 19},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'a', kind: 'ID', start: 2},
    {lexeme: ',', kind: ',', start: 3},
    {lexeme: 'b', kind: 'ID', start: 5},
    {lexeme: '=', kind: '=', start: 7},
    {lexeme: '1', kind: 'INTLIT', start: 9},
    {lexeme: ',', kind: ',', start: 10},
    {lexeme: '1', kind: 'INTLIT', start: 12},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'while', kind: 'while', start: 2},
    {lexeme: 'b', kind: 'ID', start: 8},
    {lexeme: '<', kind: '<', start: 10},
    {lexeme: 'max', kind: 'ID', start: 12},
    {lexeme: ':', kind: ':', start: 16},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'out', kind: 'ID', start: 4},
    {lexeme: '(', kind: '(', start: 7},
    {lexeme: 'x', kind: 'ID', start: 8},
    {lexeme: ')', kind: ')', start: 9},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'a', kind: 'ID', start: 4},
    {lexeme: ',', kind: ',', start: 5},
    {lexeme: 'b', kind: 'ID', start: 7},
    {lexeme: '=', kind: '=', start: 9},
    {lexeme: 'b', kind: 'ID', start: 11},
    {lexeme: ',', kind: ',', start: 12},
    {lexeme: 'a', kind: 'ID', start: 14},
    {lexeme: '+', kind: '+', start: 15},
    {lexeme: 'b', kind: 'ID', start: 16},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'end', kind: 'end', start: 2},
    {lexeme: 'newline', kind: 'newline', start: 0},
    {lexeme: 'end', kind: 'end', start: 0},
    {kind: 'EOF', lexeme: 'EOF', start: 0}
  ]
module.exports = MyTokens
