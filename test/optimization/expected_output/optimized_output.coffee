class OptimizedOutput

  @program01 =
    '''(function () {
        (function () {
            var _v1 = 1;
            _v1 = 15;
            console.log( _v1 );
        }());
    }());'''

module.exports = OptimizedOutput