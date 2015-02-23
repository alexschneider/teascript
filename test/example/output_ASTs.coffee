class MyASTs
  @program6_AST_string = '(Program (Block (VarDec (x 5))
   (VarDec (foo 123456789))
   (VarDec (bar 11))
   (VarDec (abc "string literal"))
   (VarDec (defg "strlit with \\\' escaped stuff"))
   (VarDec (y 1.23))
   (VarDec (z 0.345))
   (VarDec (bool1 true))
   (VarDec (bool2 false))
   (VarDec (nil none))
   (VarDec (a [1, (* x 5), 12]))
   (VarDec (b {a: 123, b: (* 55 123), c: 33}))
   (= x 1)
   (= foo 987654321)
   (= bar 22)
   (= abc "NEW string literal")
   (= defg "NEW strlit with \\\' escaped stuff")
   (= y 32.1)
   (= bool1 false)
   (= nil 2)
   (= nil none)))'

  @program7_AST_string = '(Program (Block
   (VarDec (foo (- 1)))
   (VarDec (bar (not x)))
   (VarDec (foobar (not (- 3))))
   (= foo (- 100))
   (= bar (not foo))
   (= foobar (not (- foo)))))'

  @program8_AST_string = '(Program (Block
   (VarDec (x (or a b)))
   (VarDec (y (or (and c d) (and e f))))
   (VarDec (foo (and (and (and (and (and a b) c) d) e) f)))
   (VarDec (bar (or (and (<= 1 2) (> 3 4)) (< 5 10))))
   (VarDec (example (or (is a b) (isnt c d))))
   (VarDec (a (> (+ 1 5) 9)))
   (VarDec (b (is (- (* 4 5) 9) 11)))
   (VarDec (all_together (or (>= (+ (% a b) c) d) (and e (isnt f false)))))
   (= all_together (or (>= (+ (% a b) c) d) (and e (isnt f false))))))'

module.exports = MyASTs