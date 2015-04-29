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

module.exports = OptimizedOutput