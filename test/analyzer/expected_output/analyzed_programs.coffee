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
      value: {lexeme: '"abc"', kind: 'STRLIT', start: 0, lineNumber: 9},
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
          value: {lexeme: '"b"', kind: 'STRLIT', start: 4, lineNumber: 13},
          type: {name: 'str'}
        }, {
          value: {lexeme: '""', kind: 'STRLIT', start:12, lineNumber: 13},
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

module.exports = MyAnalyzedPrograms