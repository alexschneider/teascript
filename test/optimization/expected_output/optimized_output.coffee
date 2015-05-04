class OptimizedOutput

  @program01 =
    '''(function () {
        (function () {
            var _v1 = 1;
            _v1 = 15;
            _v1 = 7;
            _v1 = 35;
            _v1 = 3;
        }());
    }());'''

  @program02 =
    '''(function () {
        (function () {
            var _v1 = true;
            _v1 = false;
            _v1 = true;
            _v1 = true;
            _v1 = false;
            _v1 = true;
            _v1 = false;
            _v1 = true;
            _v1 = true;
        }());
    }());'''

  @program03 =
    '''(function () {
        (function () {
            var _v1 = true;
            _v1 = false;
            _v1 = true;
            _v1 = true;
            _v1 = false;
            _v1 = true;
        }());
    }());'''

  @program04 =
    '''(function () {
        (function () {
            ( (function(lb, ub, skip) {
                var temp = [];
                for(var i = lb; i <= ub; i += skip ) {
                    temp.push(i);
                }
                return temp;
            })( 1, 5, 1)).forEach( function (_v1) {
                            (function () {
                    (["a","b","c"]).forEach( function (_v2) {
                                            (function () {
                            (function () {
                                _v3 = "dog";
                                _v4 = _v3[ 0];
                                console.log( _v1 );
                                console.log( _v2 );
                                _v4 = _v3[ 1];
                                console.log( _v1 );
                                console.log( _v2 );
                                _v4 = _v3[ 2];
                                console.log( _v1 );
                                console.log( _v2 );
                            }());
                        }());
                    })
                }());
            })
        }());
    }());'''
module.exports = OptimizedOutput


