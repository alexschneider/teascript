class CompiledOutput

  @program01 =
    '''(function () {
        var _v1 = 14;
        while ( ( _v1 < 20 ) ) {
            _v1 = ( _v1 + 1 );
        }
        var _v2 = ( ( 5 * 6 ) - _v1 );
        var _v3 = 5.5;
        var _v4 = ( ! true );
    }());'''

  @program02 =
    '''(function () {
        var _v5 = [
            1,
            2,
            3,
            4
        ];
    }());'''

  @program03 =
    '''(function () {
        var _v6 = {
            '_k1': 1,
            '_k2': 2,
            '_k3': 3
        };
    }());'''

  @program04 =
    '''(function () {
        var _v7 = {
            '_k2' : true
        }
    }());'''


module.exports = CompiledOutput
