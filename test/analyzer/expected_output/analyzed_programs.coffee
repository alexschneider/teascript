class MyAnalyzedPrograms
  @program01 = JSON.stringify({block: {statements: [
    {
        value: {lexeme: '1', kind: 'INTLIT', start: 0, lineNumber: 2},
        type: {name: 'int'}
    }, {
      value: {lexeme: '2.3', kind: 'FLOATLIT', start: 0, lineNumber: 3},
      type: {name: 'float'}
    }, {
      value: {lexeme: 'true', kind: 'true', start: 0, lineNumber: 4},
      type: {name: 'bool'}
    }, {
      value: {lexeme: 'false', kind: 'false', start: 0, lineNumber: 5},
      type: {name: 'bool'}
    }, {
      value: {lexeme: 'none', kind: 'none', start: 0, lineNumber: 6},
      type: {name: 'none'}
    }, {
      value: {lexeme: "\"abc\"", kind: 'STRLIT', start: 0, lineNumber: 9},
      type: {name: 'str'}
    }, {
      elements: [
          {
            value: {lexeme:'1', kind:'INTLIT', start:1, lineNumber:10},
            type: {name: 'int'}
          }, {
            value:{lexeme:'2', kind:'INTLIT', start:3, lineNumber:10},
            type: {name: 'int'}
          }, {
            value:{lexeme:'3', kind:'INTLIT', start:5, lineNumber:10},
            type: {name: 'int'}
        }],
      type: {name: 'list'}

    }, {
      elements: [
          {
            value: {lexeme: 'true', kind: 'true', start: 1, lineNumber: 11},
            type: {name: 'bool'}
          }, {
            value:{lexeme: "'abc'", kind: 'STRLIT', start: 7, lineNumber: 11},
            type: {name: 'str'}
          }, {
            elements: [
              {
                value:{lexeme: 'none', kind: 'none', start: 15, lineNumber: 11},
                type: {name: 'none'}
              },
            ],
            type: {name:'list'}
        }],
      type: {name:'list'}
    }, {
      elements: [],
      type: {name: 'list'}
    }, {
      keys:[
        {lexeme: 'a', kind: 'ID', start: 1, lineNumber: 13},
        {lexeme: 'c', kind: 'ID', start: 9, lineNumber: 13}
      ],
      values:[
        {
          value: {lexeme: "\"b\"", kind: 'STRLIT', start: 4, lineNumber: 13},
          type: {name: 'str'}
        }, {
          value: {lexeme: "\"\"", kind: 'STRLIT', start:12, lineNumber: 13},
          type: {name: 'str'}
        }
      ],
      type: {name:'map'}
    }, {
      keys:[], values: [],
      type: {name: 'map'}
    }, {
      elements: [
        {
          value: {lexeme: '1', kind: 'INTLIT', start: 1, lineNumber: 15},
          type: {name: 'int'}
        }, {
          value: {lexeme: '15', kind: 'INTLIT', start: 4, lineNumber: 15},
          type: {name: 'int'}
        }
      ],
      type: {name: 'tuple'}
    }, {
      elements: [],
      type: {name: 'tuple'}
    }, {
      members: [
        {
          value: {lexeme: '6', kind: 'INTLIT', start: 1, lineNumber: 17},
          type: {name: 'int'}
        }, {
          value: {lexeme: '9', kind: 'INTLIT', start: 4, lineNumber: 17},
          type: {name: 'int'}
        }, {
          value: {lexeme: '14', kind: 'INTLIT', start: 7, lineNumber: 17},
          type: {name: 'int'}
        }
      ],
      type: {name: 'set'}
    }, {
      members: [],
      type: {name: 'set'}
    }
  ]}})


  @program02 = JSON.stringify({block: {statements: [
    {
      id: {lexeme: 'isSemanticallyValid', kind: 'ID', start: 0, lineNumber: 1},
      value: {
        value: {lexeme: 'true', kind: 'true', start: 23, lineNumber: 1},
        type: {name: 'bool'}
      },
      type: {name: 'bool'}
    }, {
      id: {lexeme: 'a', kind: 'ID', start: 0, lineNumber: 2},
      value: {
        elements: [
          {
            value: {lexeme: "'analyze that'",
            kind: 'STRLIT', start: 6, lineNumber: 2},
            type: {name: 'str'}
          }, {
            value: {lexeme: "'right side of vardec'",
            kind: 'STRLIT', start: 22, lineNumber: 2},
            type: {name: 'str'}
          }, {
            token: {lexeme: 'isSemanticallyValid',
            kind: 'ID', start: 46, lineNumber: 2},
            type: {name: 'bool'}
          }
        ],
        type: {name: 'list'}
      }
      type: {name: 'list'}
    }
  ]}})

  @program03 = JSON.stringify({block: {statements: [
    {
      op: {lexeme: '-', kind: '-', start: 2, lineNumber: 1},

      left: {value: {lexeme: '5', kind: 'INTLIT', start: 0, lineNumber: 1},
      type: {name: 'int'}},

      right: {value: {lexeme: '1.3', kind: 'FLOATLIT', start: 4, lineNumber: 1},
      type: {name: 'float'}},

      type: {name: 'float'}
    }, {
      op: {lexeme: '+', kind: '+', start: 4, lineNumber: 2},

      left: {value: {lexeme: '1.6', kind: 'FLOATLIT', start: 0, lineNumber: 2},
      type: {name: 'float'}},

      right: {value: {lexeme: '4', kind: 'INTLIT', start: 6, lineNumber: 2},
      type: {name: 'int'}},

      type: {name: 'float'}
    }, {
      op: {lexeme: '*', kind: '*', start: 3, lineNumber: 3},

      left: {value: {lexeme: '10', kind: 'INTLIT', start: 0, lineNumber: 3},
      type: {name: 'int'}},

      right: {value: {lexeme: '0.5', kind: 'FLOATLIT', start: 5, lineNumber: 3},
      type: {name: 'float'}},

      type: {name: 'float'}
    }, {
      op: {lexeme: '/', kind: '/', start: 2, lineNumber: 4},

      left: {value: {lexeme: '9', kind: 'INTLIT', start: 0, lineNumber: 4},
      type: {name: 'int'}},

      right: {value: {lexeme: '4.5', kind: 'FLOATLIT', start: 4, lineNumber: 4},
      type: {name: 'float'}},

      type: {name: 'float'}
    }
  ]}})

module.exports = MyAnalyzedPrograms