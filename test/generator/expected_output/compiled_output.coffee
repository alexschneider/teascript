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
            2.5,
            3,
            4.8
        ];
        var _v6 = [
            "hello",
            16,
            "goodbye",
            4.5
        ];
    }());'''

  @program03 =
    '''(function () {
        var _v7 = {
            'first': 1,
            'second': 2,
            'third': 3
        };
        var _v8 = {
            'a': "ayy",
            'b': "bee",
            'c': "sea"
        };
    }());'''

  @program04 =
    '''(function () {
        var _v9 = {
            1: true,
            2: true,
            3: true,
            4: true,
            5: true
        };
        var _v10 = {
            'dog': true,
            'cat': true,
            'mouse': true
        };
    }());'''

  @program05 =
    '''(function () {
        var _v11 = [
            1,
            2,
            3,
            4
        ];
        var _v12 = [
            12.3,
            10.0,
            1234.1234
        ];
    }());'''

  @program06 =
    '''(function () {
        var _v13 = "hellooo";
        console.log( v_13 );
    }());'''

module.exports = CompiledOutput
