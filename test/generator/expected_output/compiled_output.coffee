class CompiledOutput

  @program01 =
    '''(function () {
        (function () {
            var _v1 = 14;
            while ( ( _v1 < 20 ) ) {
                (function () {
                    _v1 = ( _v1 + 1 );
                }());
            }
            var _v2 = ( ( 5 * 6 ) - _v1 );
            var _v3 = 5.5;
            var _v4 = ( ! true );
            var _v5 = (function(lb, ub, skip) {
                var buffer = [];
                for(var i = lb; i <= ub; i += skip ) {
                    buffer.push(i);
                }
                return buffer;
            })( 1, 10, 3);
        }());
    }());'''

  @program02 =
    '''(function () {
        (function () {
            var _v1 = [
                1,
                2.5,
                3,
                4.8
            ];
            var _v2 = [
                "hello",
                16,
                "goodbye",
                4.5
            ];
        }());
    }());'''

  @program03 =
    '''(function () {
        (function () {
            var _v1 = {
                'first': 1,
                'second': 2,
                'third': 3
            };
            var _v2 = {
                'a': "ayy",
                'b': "bee",
                'c': "sea"
            };
        }());
    }());'''

  @program04 =
    '''(function () {
        (function () {
            var _v1 = {
                1: true,
                2: true,
                3: true,
                4: true,
                5: true
            };
            var _v2 = {
                'dog': true,
                'cat': true,
                'mouse': true
            };
        }());
    }());'''

  @program05 =
    '''(function () {
        (function () {
            var _v1 = [
                1,
                2,
                3,
                4
            ];
            var _v2 = [
                12.3,
                10.0,
                1234.1234
            ];
        }());
    }());'''

  @program06 =
    '''(function () {
        (function () {
            var _v1 = "hellooo";
            return console.log( _v1 );
        }());
    }());'''

  @program07 =
    '''(function () {
        (function () {
            var _v1 = function () {
                return console.log( 'testing' );
            };
            return _v1();
        }());
    }());'''

  @program08 =
    '''(function () {
        (function () {
            var _v1 = function () {
                return (function () {
                    console.log( "hello" );
                    return console.log( "goodbye" );
                }());
            };
            return _v1();
        }());
    }());'''

  @program09 =
    '''(function () {
        (function () {
            var _v1 = false;
            var _v2 = true;
            return (function () {
                if ( ( _v1 === true ) ) {
                    return (function () {
                        return console.log( "A is TRUE" );
                    }());
                } else if ( ( _v2 === true ) ) {
                    return (function () {
                        return console.log( "B is TRUE" );
                    }());
                } else {
                    return (function () {
                        return console.log( "NEITHER is TRUE" );
                    }());
                }
            }());
        }());
    }());'''

  @program10 =
    '''(function () {
        (function () {
            var _v1 = function (_v2) {
                return (function () {
                    return ( _v2 * 2 );
                }());
            };
            _v1 (_v1 (_v1 ( 2 ) ) );
            return _v1 (_v1 (_v1 (_v1 (_v1 ( 3 ) ) ) ) );
        }());
    }());'''

  @program11 =
    '''(function () {
        (function () {
            var _v1 = function (_v2) {
                return (function () {
                    return ( _v2 * 2 );
                }());
            };
        }());
    }());'''

  @program12 =
    '''(function () {
        (function () {
            var _v1 = function (_v2, _v3) {
                return (function () {
                    return ( _v2 * _v3 );
                }());
            };
        }());
    }());'''

  @program13 =
    '''(function () {
            (function () {
                Math.sqrt( 100 );
                Math.sqrt( 9 );
                Math.sqrt( 1 );
                return Math.sqrt( 0 );
            }());
        }());
    '''

  @program14 =
    '''(function () {
          (function () {
              ( (function(lb, ub, skip) {
                  var buffer = [];
                  for(var i = lb; i <= ub; i += skip ) {
                      buffer.push(i);
                  }
                  return buffer;
              })( 1, 10 - 1, 1)).forEach( function (_v1) {
                  (function () {
                      ( (function(lb, ub, skip) {
                          var buffer = [];
                          for(var i = lb; i <= ub; i += skip ) {
                              buffer.push(i);
                          }
                          return buffer;
                      })( _v1, 10 - 1, 1)).forEach( function (_v2) {
                          (function () {
                              return console.log( ( _v1 + _v2 ) );
                          }());
                      });
                  }());
              });
              var _v3 = [
                  1,
                  2,
                  3,
                  4,
                  5
              ];
              (_v3).forEach( function (_v4) {
                  (function () {
                      console.log( "My number is " );
                      return console.log( _v4 );
                  }());
              });
              var _v5 = 0;
              ( [
                  5,
                  4,
                  3
              ]).forEach( function (_v6) {
                  (function () {
                      return ( _v5 += 1 );
                  }());
              });
              (["x","y","l","o","p","h","o","n","e"]).forEach( function (_v7) {
                  (function () {
                      return console.log( _v7 );
                  }());
              });
          }());
      }());'''

  @program15 =
    '''(function () {
        (function () {
            var _v1 = (function () {
                if ( true ) {
                    return (function () {
                        return 5;
                    }());
                } else {
                    return (function () {
                        return 6;
                    }());
                }
            }());
            console.log( _v1 );
            return console.log( null );
        }());
    }());'''


module.exports = CompiledOutput
