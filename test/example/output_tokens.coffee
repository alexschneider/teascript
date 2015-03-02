class MyTokens
  @program1_tokens = [
    {lexeme: 'x', kind: 'ID', start: 0, lineNumber: 0},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 0},
    {lexeme: '2', kind: 'INTLIT', start: 5, lineNumber: 0},
    {lexeme: '*', kind: '*', start: 7, lineNumber: 0},
    {lexeme: '3', kind: 'INTLIT', start: 9, lineNumber: 0},
    {lexeme: 'newline', kind: 'newline', start: 9, lineNumber: 0},
    {lexeme: 'y', kind: 'ID', start: 0, lineNumber: 5},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 5},
    {lexeme: '8', kind: 'INTLIT', start: 5, lineNumber: 5},
    {lexeme: '/', kind: '/', start: 7, lineNumber: 5},
    {lexeme: '4', kind: 'INTLIT', start: 9, lineNumber: 5},
    {lexeme: 'newline', kind: 'newline', start: 9, lineNumber: 5},
    {lexeme: 'x', kind: 'ID', start: 0, lineNumber: 7},
    {lexeme: '=', kind: '=', start: 2, lineNumber: 7},
    {lexeme: 'x', kind: 'ID', start: 4, lineNumber: 7},
    {lexeme: '*', kind: '*', start: 6, lineNumber: 7},
    {lexeme: 'y', kind: 'ID', start: 8, lineNumber: 7},
    {lexeme: 'newline', kind: 'newline', start: 8, lineNumber: 7},
    {lexeme: 'newFunc', kind: 'ID', start: 0, lineNumber: 9},
    {lexeme: ':=', kind: ':=', start: 8, lineNumber: 9},
    {lexeme: '(', kind: '(', start: 11, lineNumber: 9},
    {lexeme: 'x', kind: 'ID', start: 12, lineNumber: 9},
    {lexeme: ',', kind: ',', start: 13, lineNumber: 9},
    {lexeme: 'y', kind: 'ID', start: 15, lineNumber: 9},
    {lexeme: ')', kind: ')', start: 16, lineNumber: 9},
    {lexeme: '->', kind: '->', start: 18, lineNumber: 9},
    {lexeme: 'newline', kind: 'newline', start: 18, lineNumber: 9},
    {lexeme: 'return', kind: 'return', start: 4, lineNumber: 10},
    {lexeme: 'x', kind: 'ID', start: 11, lineNumber: 10},
    {lexeme: 'if', kind: 'if', start: 13, lineNumber: 10},
    {lexeme: 'x', kind: 'ID', start: 16, lineNumber: 10},
    {lexeme: '>=', kind: '>=', start: 18, lineNumber: 10},
    {lexeme: 'y', kind: 'ID', start: 21, lineNumber: 10},
    {lexeme: 'else', kind: 'else', start: 23, lineNumber: 10},
    {lexeme: 'true', kind: 'true', start: 28, lineNumber: 10},
    {lexeme: 'newline', kind: 'newline', start: 28, lineNumber: 10},
    {lexeme: 'end', kind: 'end', start: 0, lineNumber: 11},
    {lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 11},
    {lexeme: 'x', kind: 'ID', start: 0, lineNumber: 13},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 13},
    {lexeme: '4', kind: 'INTLIT', start: 5, lineNumber: 13},
    {lexeme: 'newline', kind: 'newline', start: 20, lineNumber: 13},
    {lexeme: 'y', kind: 'ID', start: 0, lineNumber: 14},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 14},
    {lexeme: '3.14', kind: 'FLOATLIT', start: 5, lineNumber: 14},
    {lexeme: 'newline', kind: 'newline', start: 17, lineNumber: 14},
    {lexeme: 'is_this_true', kind: 'ID', start: 0, lineNumber: 15},
    {lexeme: '=', kind: '=', start: 13, lineNumber: 15},
    {lexeme: 'false', kind: 'false', start: 15, lineNumber: 15},
    {lexeme: 'newline', kind: 'newline', start: 16, lineNumber: 15},
    {lexeme: 'z', kind: 'ID', start: 0, lineNumber: 16},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 16},
    {lexeme: 'none', kind: 'none', start: 5, lineNumber: 16},
    {lexeme: 'newline', kind: 'newline', start: 17, lineNumber: 16},
    {lexeme: 'my_string', kind: 'ID', start: 0, lineNumber: 18},
    {lexeme: ':=', kind: ':=', start: 10, lineNumber: 18},
    {lexeme: '"Oh baby!"',
    kind: 'STRLIT',
    start: 13,
    lineNumber: 18},
    {lexeme: 'newline', kind: 'newline', start: 14, lineNumber: 18},
    {lexeme: 'my_list', kind: 'ID', start: 0, lineNumber: 19},
    {lexeme: ':=', kind: ':=', start: 8, lineNumber: 19},
    {lexeme: '[', kind: '[', start: 11, lineNumber: 19},
    {lexeme: '1', kind: 'INTLIT', start: 12, lineNumber: 19},
    {lexeme: '..', kind: '..', start: 13, lineNumber: 19},
    {lexeme: '5', kind: 'INTLIT', start: 15, lineNumber: 19},
    {lexeme: ']', kind: ']', start: 16, lineNumber: 19},
    {lexeme: 'newline', kind: 'newline', start: 23, lineNumber: 19},
    {lexeme: 'my_tuple', kind: 'ID', start: 0, lineNumber: 20},
    {lexeme: ':=', kind: ':=', start: 9, lineNumber: 20},
    {lexeme: '(', kind: '(', start: 12, lineNumber: 20},
    {lexeme: '1', kind: 'INTLIT', start: 13, lineNumber: 20},
    {lexeme: ',', kind: ',', start: 14, lineNumber: 20},
    {lexeme: '2', kind: 'INTLIT', start: 15, lineNumber: 20},
    {lexeme: ',', kind: ',', start: 16, lineNumber: 20},
    {lexeme: '3', kind: 'INTLIT', start: 17, lineNumber: 20},
    {lexeme: ',', kind: ',', start: 18, lineNumber: 20},
    {lexeme: '2', kind: 'INTLIT', start: 19, lineNumber: 20},
    {lexeme: ',', kind: ',', start: 20, lineNumber: 20},
    {lexeme: '1', kind: 'INTLIT', start: 21, lineNumber: 20},
    {lexeme: ')', kind: ')', start: 22, lineNumber: 20},
    {lexeme: 'newline', kind: 'newline', start: 23, lineNumber: 20},
    {lexeme: 'my_set', kind: 'ID', start: 0, lineNumber: 21},
    {lexeme: ':=', kind: ':=', start: 7, lineNumber: 21},
    {lexeme: '<', kind: '<', start: 10, lineNumber: 21},
    {lexeme: '1', kind: 'INTLIT', start: 11, lineNumber: 21},
    {lexeme: ',', kind: ',', start: 12, lineNumber: 21},
    {lexeme: '3', kind: 'INTLIT', start: 13, lineNumber: 21},
    {lexeme: ',', kind: ',', start: 14, lineNumber: 21},
    {lexeme: '5', kind: 'INTLIT', start: 15, lineNumber: 21},
    {lexeme: ',', kind: ',', start: 16, lineNumber: 21},
    {lexeme: '7', kind: 'INTLIT', start: 17, lineNumber: 21},
    {lexeme: '>', kind: '>', start: 18, lineNumber: 21},
    {lexeme: 'newline', kind: 'newline', start: 23, lineNumber: 21},
    {lexeme: 'my_map', kind: 'ID', start: 0, lineNumber: 22},
    {lexeme: ':=', kind: ':=', start: 7, lineNumber: 22},
    {lexeme: '{', kind: '{', start: 10, lineNumber: 22},
    {lexeme: '"lat"', kind: 'STRLIT', start: 11, lineNumber: 22},
    {lexeme: ':', kind: ':', start: 16, lineNumber: 22},
    {lexeme: '51.24', kind: 'FLOATLIT', start: 17, lineNumber: 22},
    {lexeme: ',', kind: ',', start: 22, lineNumber: 22},
    {lexeme: '"long"', kind: 'STRLIT', start: 23, lineNumber: 22},
    {lexeme: ':', kind: ':', start: 29, lineNumber: 22},
    {lexeme: '0.18', kind: 'FLOATLIT', start: 30, lineNumber: 22},
    {lexeme: '}', kind: '}', start: 34, lineNumber: 22},
    {lexeme: 'newline', kind: 'newline', start: 36, lineNumber: 22},         
    {kind: 'EOF', lexeme: 'EOF', start: 0}
  ]


  @program2_tokens = [
    {lexeme: 'x', kind: 'ID', start: 0, lineNumber: 0},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 0},
    {lexeme: '2', kind: 'INTLIT', start: 5, lineNumber: 0},
    {lexeme: 'newline', kind: 'newline', start: 5, lineNumber: 0},
    {lexeme: 'x', kind: 'ID', start: 0, lineNumber: 1},
    {lexeme: '**', kind: '**', start: 1, lineNumber: 1},
    {lexeme: '2', kind:'INTLIT', start: 3, lineNumber: 1},
    {lexeme: 'newline', kind: 'newline', start: 3, lineNumber: 1},
    {lexeme: 'x', kind: 'ID', start: 0, lineNumber: 2},
    {lexeme: '+=', kind: '+=', start: 2, lineNumber: 2},
    {lexeme: '2', kind: 'INTLIT', start: 5, lineNumber: 2},
    {lexeme: 'newline', kind: 'newline', start: 5, lineNumber: 2},
    {lexeme: 'collatz', kind: 'ID', start: 0, lineNumber: 4},
    {lexeme: ':=', kind: ':=', start: 8, lineNumber: 4},
    {lexeme: '(', kind: '(', start: 11, lineNumber: 4},
    {lexeme: 'x', kind: 'ID', start: 12, lineNumber: 4},
    {lexeme: ')', kind: ')', start: 13, lineNumber: 4},
    {lexeme: '->', kind: '->', start: 15, lineNumber: 4},
    {lexeme: 'newline', kind: 'newline', start: 15, lineNumber: 4},
    {lexeme: 'out', kind: 'ID', start: 4, lineNumber: 5},
    {lexeme: '(', kind: '(', start: 7, lineNumber: 5},
    {lexeme: 'x', kind: 'ID', start: 8, lineNumber: 5},
    {lexeme: ')', kind: ')', start: 9, lineNumber: 5},
    {lexeme: 'newline', kind: 'newline', start: 9, lineNumber: 5},
    {lexeme: 'return', kind: 'return', start: 4, lineNumber: 6},
    {lexeme: 'x', kind: 'ID', start: 11, lineNumber: 6},
    {lexeme: 'if', kind: 'if', start: 13, lineNumber: 6},
    {lexeme: 'x', kind: 'ID', start: 16, lineNumber: 6},
    {lexeme: 'is', kind: 'is', start: 18, lineNumber: 6},
    {lexeme: '1', kind: 'INTLIT', start: 21, lineNumber: 6},
    {lexeme: 'else', kind: 'else', start: 23, lineNumber: 6},
    {lexeme: '(', kind: '(', start: 28, lineNumber: 6},
    {lexeme: 'collatz', kind: 'ID', start: 30, lineNumber: 6},
    {lexeme: '(', kind: '(', start: 37, lineNumber: 6},
    {lexeme: 'x', kind: 'ID', start: 38, lineNumber: 6},
    {lexeme: '/', kind: '/', start: 39, lineNumber: 6},
    {lexeme: '2', kind: 'INTLIT', start: 40, lineNumber: 6},
    {lexeme: ')', kind: ')', start: 41, lineNumber: 6},
    {lexeme: 'if', kind: 'if', start: 43, lineNumber: 6},
    {lexeme: 'x', kind: 'ID', start: 46, lineNumber: 6},
    {lexeme: '%', kind: '%', start: 48, lineNumber: 6},
    {lexeme: '2', kind: 'INTLIT', start: 50, lineNumber: 6},
    {lexeme: 'is', kind: 'is', start: 52, lineNumber: 6},
    {lexeme: '0', kind: 'INTLIT', start: 55, lineNumber: 6},
    {lexeme: 'else', kind: 'else', start: 57, lineNumber: 6},
    {lexeme: 'collatz', kind: 'ID', start: 62, lineNumber: 6},
    {lexeme: '(', kind: '(', start: 69, lineNumber: 6},
    {lexeme: '3', kind: 'INTLIT', start: 70, lineNumber: 6},
    {lexeme: '*', kind: '*', start: 71, lineNumber: 6},
    {lexeme: 'x', kind: 'ID', start: 72, lineNumber: 6},
    {lexeme: '+', kind: '+', start: 73, lineNumber: 6},
    {lexeme: '1', kind: 'INTLIT', start: 74, lineNumber: 6},
    {lexeme: ')', kind: ')', start: 75, lineNumber: 6},
    {lexeme: ')', kind: ')', start: 76, lineNumber: 6},
    {lexeme: 'newline', kind: 'newline', start: 76, lineNumber: 6},
    {kind: 'EOF', lexeme: 'EOF', start: 0}
  ]

  @program3_tokens = [
    {lexeme: 'a', kind: 'ID', start: 0, lineNumber: 0},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 0},
    {lexeme: '4', kind: 'INTLIT', start: 5, lineNumber: 0},
    {lexeme: '+', kind: '+', start: 7, lineNumber: 0},
    {lexeme: '5', kind: 'INTLIT', start: 9, lineNumber: 0},
    {lexeme: 'newline', kind: 'newline', start: 10, lineNumber: 0},
    {lexeme: 'b', kind: 'ID', start: 0, lineNumber: 1},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 1},
    {lexeme: '3', kind: 'INTLIT', start: 5, lineNumber: 1},
    {lexeme: '/', kind: '/', start: 7, lineNumber: 1},
    {lexeme: '2', kind: 'INTLIT', start: 9, lineNumber: 1},
    {lexeme: 'newline', kind: 'newline', start: 11, lineNumber: 1},
    {lexeme: 'for', kind: 'for', start: 0, lineNumber: 4},
    {lexeme: 'a', kind: 'ID', start: 4, lineNumber: 4},
    {lexeme: 'in', kind: 'in', start: 6, lineNumber: 4},
    {lexeme: 'x', kind: 'ID', start: 9, lineNumber: 4},
    {lexeme: ':', kind: ':', start: 10, lineNumber: 4},
    {lexeme: 'newline', kind: 'newline', start: 10, lineNumber: 4},
    {lexeme: 'out', kind: 'ID', start: 4, lineNumber: 5},
    {lexeme: '(', kind: '(', start: 7, lineNumber: 5},
    {lexeme: 'a', kind: 'ID', start: 8, lineNumber: 5},
    {lexeme: ')', kind: ')', start: 9, lineNumber: 5},
    {lexeme: 'newline', kind: 'newline', start: 9, lineNumber: 5},
    {lexeme: 'end', kind: 'end', start: 0, lineNumber: 6},
    {lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 6},
    {kind: 'EOF', lexeme: 'EOF', start: 0}
  ]

  @program4_tokens = [
    {lexeme: 'for', kind: 'for', start: 0, lineNumber: 0},
    {lexeme: 'i', kind: 'ID', start: 4, lineNumber: 0},
    {lexeme: 'in', kind: 'in', start: 6, lineNumber: 0},
    {lexeme: '0', kind: 'INTLIT', start: 9, lineNumber: 0},
    {lexeme: '..', kind: '..', start: 10, lineNumber: 0},
    {lexeme: '5', kind: 'INTLIT', start: 12, lineNumber: 0},
    {lexeme: ':', kind: ':', start: 13, lineNumber: 0},
    {lexeme: 'newline', kind: 'newline', start: 13, lineNumber: 0},
    {lexeme: 'out', kind: 'ID', start: 2, lineNumber: 1},
    {lexeme: '(', kind: '(', start: 5, lineNumber: 1},
    {lexeme: 'i', kind: 'ID', start: 6, lineNumber: 1},
    {lexeme: ')', kind: ')', start: 7, lineNumber: 1},
    {lexeme: 'newline', kind: 'newline', start: 8, lineNumber: 1},
    {lexeme: 'end', kind: 'end', start: 0, lineNumber: 2},
    {lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 2},
    {lexeme: 'for', kind: 'for', start: 0, lineNumber: 4},
    {lexeme: 'i', kind: 'ID', start: 4, lineNumber: 4},
    {lexeme: 'in', kind: 'in', start: 6, lineNumber: 4},
    {lexeme: '0', kind: 'INTLIT', start: 9, lineNumber: 4},
    {lexeme: '..', kind: '..', start: 10, lineNumber: 4},
    {lexeme: '10', kind: 'INTLIT', start: 12, lineNumber: 4},
    {lexeme: 'by', kind: 'by', start: 15, lineNumber: 4},
    {lexeme: '2', kind: 'INTLIT', start: 18, lineNumber: 4},
    {lexeme: ':', kind: ':', start: 19, lineNumber: 4},
    {lexeme: 'newline', kind: 'newline', start: 19, lineNumber: 4},
    {lexeme: 'out', kind: 'ID', start: 2, lineNumber: 5},
    {lexeme: '(', kind: '(', start: 5, lineNumber: 5},
    {lexeme: 'i', kind: 'ID', start: 6, lineNumber: 5},
    {lexeme: ')', kind: ')', start: 7, lineNumber: 5},
    {lexeme: 'newline', kind: 'newline', start: 8, lineNumber: 5},
    {lexeme: 'end', kind: 'end', start: 0, lineNumber: 6},
    {lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 6},
    {lexeme: 'for', kind: 'for', start: 0, lineNumber: 8},
    {lexeme: 'i', kind: 'ID', start: 4, lineNumber: 8},
    {lexeme: 'in', kind: 'in', start: 6, lineNumber: 8},
    {lexeme: '\'xylophones\'',
    kind: 'STRLIT',
    start: 9,
    lineNumber: 8},
    {lexeme: '[', kind: '[', start: 21, lineNumber: 8},
    {lexeme: '3', kind: 'INTLIT', start: 22, lineNumber: 8},
    {lexeme: '..', kind: '..', start: 23, lineNumber: 8},
    {lexeme: '6', kind: 'INTLIT', start: 25, lineNumber: 8},
    {lexeme: ']', kind: ']', start: 26, lineNumber: 8},
    {lexeme: ':', kind: ':', start: 27, lineNumber: 8},
    {lexeme: 'newline', kind: 'newline', start: 27, lineNumber: 8},
    {lexeme: 'out', kind: 'ID', start: 2, lineNumber: 9},
    {lexeme: '(', kind: '(', start: 5, lineNumber: 9},
    {lexeme: 'i', kind: 'ID', start: 6, lineNumber: 9},
    {lexeme: ')', kind: ')', start: 7, lineNumber: 9},
    {lexeme: 'newline', kind: 'newline', start: 8, lineNumber: 9},
    {lexeme: 'end', kind: 'end', start: 0, lineNumber: 10},
    {lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 10},
    {lexeme: 'for', kind: 'for', start: 0, lineNumber: 11},
    {lexeme: 'i', kind: 'ID', start: 4, lineNumber: 11},
    {lexeme: 'in', kind: 'in', start: 6, lineNumber: 11},
    {lexeme: '"xylophones"',
    kind: 'STRLIT',
    start: 9,
    lineNumber: 11},
    {lexeme: '[', kind: '[', start: 21, lineNumber: 11},
    {lexeme: '0', kind: 'INTLIT', start: 22, lineNumber: 11},
    {lexeme: '..', kind: '..', start: 23, lineNumber: 11},
    {lexeme: '5', kind: 'INTLIT', start: 25, lineNumber: 11},
    {lexeme: 'by', kind: 'by', start: 27, lineNumber: 11},
    {lexeme: '3', kind: 'INTLIT', start: 30, lineNumber: 11},
    {lexeme: ']', kind: ']', start: 31, lineNumber: 11},
    {lexeme: ':', kind: ':', start: 32, lineNumber: 11},
    {lexeme: 'newline', kind: 'newline', start: 32, lineNumber: 11},
    {lexeme: 'out', kind: 'ID', start: 2, lineNumber: 12},
    {lexeme: '(', kind: '(', start: 5, lineNumber: 12},
    {lexeme: 'i', kind: 'ID', start: 6, lineNumber: 12},
    {lexeme: ')', kind: ')', start: 7, lineNumber: 12},
    {lexeme: 'newline', kind: 'newline', start: 8, lineNumber: 12},
    {lexeme: 'end', kind: 'end', start: 0, lineNumber: 13},
    {lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 13},
    {lexeme: 'x', kind: 'ID', start: 0, lineNumber: 14},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 14},
    {lexeme: '"xylophones"',
    kind: 'STRLIT',
    start: 5,
    lineNumber: 14},
    {lexeme: '[', kind: '[', start: 17, lineNumber: 14},
    {lexeme: '3', kind: 'INTLIT', start: 18, lineNumber: 14},
    {lexeme: '..', kind: '..', start: 19, lineNumber: 14},
    {lexeme: '6', kind: 'INTLIT', start: 21, lineNumber: 14},
    {lexeme: ']', kind: ']', start: 22, lineNumber: 14},
    {lexeme: 'newline', kind: 'newline', start: 23, lineNumber: 14},
    {lexeme: 'y', kind: 'ID', start: 0, lineNumber: 15},
    {lexeme: ':=', kind: ':=', start: 2, lineNumber: 15},
    {lexeme: '[', kind: '[', start: 5, lineNumber: 15},
    {lexeme: '1', kind: 'INTLIT', start: 6, lineNumber: 15},
    {lexeme: ',', kind: ',', start: 7, lineNumber: 15},
    {lexeme: '6', kind: 'INTLIT', start: 9, lineNumber: 15},
    {lexeme: ',', kind: ',', start: 10, lineNumber: 15},
    {lexeme: '3', kind: 'INTLIT', start: 12, lineNumber: 15},
    {lexeme: ',', kind: ',', start: 13, lineNumber: 15},
    {lexeme: '5', kind: 'INTLIT', start: 15, lineNumber: 15},
    {lexeme: ',', kind: ',', start: 16, lineNumber: 15},
    {lexeme: '8', kind: 'INTLIT', start: 18, lineNumber: 15},
    {lexeme: ',', kind: ',', start: 19, lineNumber: 15},
    {lexeme: '9', kind: 'INTLIT', start: 21, lineNumber: 15},
    {lexeme: ']', kind: ']', start: 22, lineNumber: 15},
    {lexeme: '[', kind: '[', start: 23, lineNumber: 15},
    {lexeme: '1', kind: 'INTLIT', start: 24, lineNumber: 15},
    {lexeme: '..', kind: '..', start: 25, lineNumber: 15},
    {lexeme: '6', kind: 'INTLIT', start: 27, lineNumber: 15},
    {lexeme: 'by', kind: 'by', start: 29, lineNumber: 15},
    {lexeme: '2', kind: 'INTLIT', start: 32, lineNumber: 15},
    {lexeme: ']', kind: ']', start: 33, lineNumber: 15},
    {lexeme: 'newline', kind: 'newline', start: 34, lineNumber: 15},
    {lexeme: 'string_with_escaped_characters',
    kind: 'ID',
    start: 0,
    lineNumber: 17},
    {lexeme: '=', kind: '=', start: 31, lineNumber: 17},
    {lexeme: '"this is a string that allows for escaped
    \\\' stuff \\" since teascript is \\\\ so darn awesome!"',
    kind: 'STRLIT',
    start: 33,
    lineNumber: 17},
    {lexeme: 'newline', kind: 'newline', start: 33, lineNumber: 17},
    {kind: 'EOF', lexeme: 'EOF', start: 0}
  ]

  @program5_tokens = [
    {lexeme: 'print_fib', kind: 'ID', start: 0, lineNumber: 2},
    {lexeme: ':=', kind: ':=', start: 10, lineNumber: 2},
    {lexeme: '(', kind: '(', start: 13, lineNumber: 2},
    {lexeme: 'max', kind: 'ID', start: 14, lineNumber: 2},
    {lexeme: ')', kind: ')', start: 17, lineNumber: 2},
    {lexeme: '->', kind: '->', start: 19, lineNumber: 2},
    {lexeme: 'newline', kind: 'newline', start: 19, lineNumber: 2},
    {lexeme: 'a', kind: 'ID', start: 2, lineNumber: 4},
    {lexeme: ',', kind: ',', start: 3, lineNumber: 4},
    {lexeme: 'b', kind: 'ID', start: 5, lineNumber: 4},
    {lexeme: '=', kind: '=', start: 7, lineNumber: 4},
    {lexeme: '1', kind: 'INTLIT', start: 9, lineNumber: 4},
    {lexeme: ',', kind: ',', start: 10, lineNumber: 4},
    {lexeme: '1', kind: 'INTLIT', start: 12, lineNumber: 4},
    {lexeme: 'newline', kind: 'newline', start: 12, lineNumber: 4},
    {lexeme: 'while', kind: 'while', start: 2, lineNumber: 5},
    {lexeme: 'b', kind: 'ID', start: 8, lineNumber: 5},
    {lexeme: '<', kind: '<', start: 10, lineNumber: 5},
    {lexeme: 'max', kind: 'ID', start: 12, lineNumber: 5},
    {lexeme: ':', kind: ':', start: 16, lineNumber: 5},
    {lexeme: 'newline', kind: 'newline', start: 16, lineNumber: 5},
    {lexeme: 'out', kind: 'ID', start: 4, lineNumber: 6},
    {lexeme: '(', kind: '(', start: 7, lineNumber: 6},
    {lexeme: 'x', kind: 'ID', start: 8, lineNumber: 6},
    {lexeme: ')', kind: ')', start: 9, lineNumber: 6},
    {lexeme: 'newline', kind: 'newline', start: 9, lineNumber: 6},
    {lexeme: 'a', kind: 'ID', start: 4, lineNumber: 7},
    {lexeme: ',', kind: ',', start: 5, lineNumber: 7},
    {lexeme: 'b', kind: 'ID', start: 7, lineNumber: 7},
    {lexeme: '=', kind: '=', start: 9, lineNumber: 7},
    {lexeme: 'b', kind: 'ID', start: 11, lineNumber: 7},
    {lexeme: ',', kind: ',', start: 12, lineNumber: 7},
    {lexeme: 'a', kind: 'ID', start: 14, lineNumber: 7},
    {lexeme: '+', kind: '+', start: 15, lineNumber: 7},
    {lexeme: 'b', kind: 'ID', start: 16, lineNumber: 7},
    {lexeme: 'newline', kind: 'newline', start: 16, lineNumber: 7},
    {lexeme: 'end', kind: 'end', start: 2, lineNumber: 8},
    {lexeme: 'newline', kind: 'newline', start: 2, lineNumber: 8},
    {lexeme: 'end', kind: 'end', start: 0, lineNumber: 9},
    {lexeme: 'newline', kind: 'newline', start: 0, lineNumber: 9},
    {kind: 'EOF', lexeme: 'EOF', start: 0}
  ]
module.exports = MyTokens
