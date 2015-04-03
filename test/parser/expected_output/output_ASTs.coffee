class MyASTs
  @program01_AST_string = '(Program (Block
   (VarDec (x (* 2 3)))
   (VarDec (y (/ 8 4)))
   (= x (* x y))
   (VarDec (newFunc
    (Func (x, y)
      (Block (Return (if (>= x y) x else true))))))
   (VarDec (x 4))
   (VarDec (y 3.14))
   (= is_this_true false)
   (VarDec (z none))
   (VarDec (my_string "Oh baby!"))
   (VarDec (my_list [(1..5 by 1)]))
   (VarDec (my_tuple |1, 2, 3, 2, 1|))
   (VarDec (my_set <1, 3, 5, 7>))
   (VarDec (my_map {lat: 51.24, long: 0.18}))))'

  @program02_AST_string = '(Program (Block
    (VarDec (x 2))
    (** x 2)
    (= x (+ x 2))
    (VarDec (collatz
      (Func (x)
        (Block
          (Invoke out (x))
          (Return (if (is x 1) x else (if (is (% x 2) 0)
                    (Invoke collatz ((/ x 2)))
                  else
                    (Invoke collatz ((+ (* 3 x) 1))))))))))))'

  @program03_AST_string = '(Program (Block
    (VarDec (a (+ 4 5)))
    (VarDec (b (/ 3 2)))
    (For a x (Block (Invoke out (a))))))'

  @program04_AST_string = '(Program (Block
    (For i (0..5 by 1)
      (Block (Invoke out (i))))
    (For i (0..10 by 2)
      (Block (Invoke out (i))))
    (For i (Subscript \'xylophones\' (3..6 by 1))
      (Block (Invoke out (i))))
    (For i (Subscript "xylophones" (0..5 by 3))
      (Block (Invoke out (i))))
    (VarDec (x (Subscript "xylophones" (3..6 by 1))))
    (VarDec (y (Subscript [1, 6, 3, 5, 8, 9] (1..6 by 2))))
    (= string_with_escaped_characters "this is a string
      that allows for escaped \\\' stuff \\" since teascript is
      \\\\ so darn awesome!")))'

  @program05_AST_string = '(Program (Block (VarDec
    (print_fib (Func (max)
      (Block (VarDec (a 1)) (VarDec (b 1))
        (While (< b max)
          (Block
            (Invoke out (x))
            (= save a)
            (= a (+ a b))
            (= b save)))))))))'

  @program06_AST_string = '(Program (Block (VarDec (x 5))
   (VarDec (foo 123456789))
   (VarDec (bar 11))
   (VarDec (abc "string literal"))
   (VarDec (defg "strlit with \\\' escaped stuff"))
   (VarDec (y 1.23))
   (VarDec (z 0.345))
   (VarDec (bool1 true))
   (VarDec (bool2 false))
   (VarDec (set1 <1, 2, 3>))
   (VarDec (set2 <1, 2, 3, <4, 5, 6>, <7, 8, <9, 10, 11>>>))
   (VarDec (comma_example1 {a: 1, b: 2}))
   (VarDec (comma_example2 <1, 2>))
   (VarDec (comma_example3 [1, 2]))
   (VarDec (combo [<a, b, c>, {foo: "bar", foobar: <1, a>}]))
   (VarDec (multiline_combo [{a: b, c: d},
                             <1, 2, 3>,
                             {e: f, g: h},
                             [5, 6, [7, [8, 9]]]]))
   (VarDec (nil none))
   (VarDec (a [1, (* x 5), 12]))
   (VarDec (b {a: 123, b: (* 55 123), c: 33}))
   (VarDec (c |1, 2, 3|))
   (= x 1)
   (= foo 987654321)
   (= bar 22)
   (= abc "NEW string literal")
   (= defg "NEW strlit with \\\' escaped stuff")
   (= y 32.1)
   (= bool1 false)
   (= nil 2)
   (= nil none)
   (= (. (Subscript g 4) f) 3)
   (= (Subscript g (** 3 9))
   (if b a else c))))'

  @program07_AST_string = '(Program (Block
   (VarDec (foo (- 1)))
   (VarDec (bar (not x)))
   (VarDec (foobar (not (- 3))))
   (= foo (- 100))
   (= bar (not foo))
   (= foobar (not (- foo)))))'

  @program08_AST_string = '(Program (Block
   (VarDec (x (or a b)))
   (VarDec (y (or (and c d) (and e f))))
   (VarDec (foo (and (and (and (and (and a b) c) d) e) f)))
   (VarDec (bar (or (and (<= 1 2) (> 3 4)) (< 5 10))))
   (VarDec (example (or (is a b) (isnt c d))))
   (VarDec (a (> (+ 1 5) 9)))
   (VarDec (b (is (- (* 4 5) 9) 11)))
   (VarDec (all_together (or (>= (+ (% a b) c) d) (and e (isnt f false)))))
   (= all_together (or (>= (+ (% a b) c) d) (and e (isnt f false))))))'

  @program09_AST_string = '(Program (Block (VarDec (z "z"))
   (For x "abc" (= z x))
   (For y <1, 7, 9> (VarDec (a b)))
   (For y [a, b, c] (Block (Invoke f (\'strlit1\', \'strlit2\', 1, 2))
                           (Invoke out (y))))
   (For var some_variable (Block (= z var)))))'

  @program10_AST_string = '(Program (Block
   (While (and (is (+ (/ x 10) 5) 2) (> y x)) (= x (+ x 1)))
   (While (VarDec (x true)) "vardec expressions are da bomb")
   (While true (Block (Invoke out ("I am in an infinite loop!!"))))
   (While (or (or (or (or a b) c) d) <1, 2, 3, (> 5 6)>)
      (Block (VarDec (a \'a\'))
             (VarDec (b \'b\'))
             (VarDec (save a))
             (= a b)
             (= b save)))))'

  @program11_AST_string = '(Program (Block
    (* 1 8)
    (VarDec (f (Func (a, b, c)
      (Block
        (VarDec (x (+ a 100)))
        (= a b)
        (Return x)))))
    (VarDec (g (Func (first_arg, another_arg)
      (Block
        (Invoke out (\'hi\'))
        (VarDec (string "here is a super cool string thing"))
        (Return (Invoke f (string, <first_arg, 1>, <another_arg>)))))))
    (Func (anonymous_functions) (Invoke are (\'cool\')))))'

  @program12_AST_string = "(Program (Block
    (Invoke f (1, 2, 3))
    (. a (. (Subscript b 1) (. c (. (Subscript d 6)
      (Invoke e ('arg1', 'arg2'))))))
      (Invoke (Invoke f (a, b)) (c))))"

  @program13_AST_string = '(Program (Block
    (if true (Block (Invoke out ("hello")))
      else if false (Block (Invoke out ("goodbye")))
      else (Block (Invoke out ("go away"))))
    (if true (Block (Invoke out ("hello")))
      else if false (Invoke out ("goodbye")))
    (if true (Block (Invoke out ("hello"))))
    (if true (Return true))
      (if true (Invoke out (\'hi\')))
        (if a
          (if b
            (if c
              (if d (VarDec (x true))))))))'

  @program14_AST_string = '(Program (Block
    (+ (** 3 4) 5)
    (+ (- (** 2 4)) 5)
    (** 3 (** 4 5))
    (+ (** 2 (** 1 (- 3))) 1)
    (** 2 (- (** 3 (- 4))))))'

  @program15_AST_string = '(Program (Block (if b a else c)))'

  @program16_AST_string = '(Program (Block (if b a)))'

  @program17_AST_string = '(Program (Block
    (= x (Class
      (VarDec (a none))
      (= init (Func (arg) (Block (= a "Yo"))))
      (= x (Func (arg) (Block (** arg 2))))
      (= y (Func (arg) (Block (** arg 0.5))))))))'

  @program18_AST_string = '(Program (Block
    (VarDec (a 100))
    (VarDec (b 50))
    (VarDec (c 150))
    (VarDec (funcA (Func (a, b, c) (Block
      (if (or (<= a b) (<= c a)) (Block
        (Invoke out (a)))
      else (Block
        (= c (- c 1))
        (Invoke funcA (a, b, c))))))))))'

  @program19_AST_string = '(Program (Block
      (VarDec (funcB (Func (n)
        (Block
          (if (isnt n 0) (Block
           (Return n)))))))
      (VarDec (a [1, 2, 3]))
      (For x a (Block
        (Invoke funcB (x))))))'

  @program20_AST_string = '(Program (Block
    (VarDec (x (Func ()
      (Block (Return none)))))
    (Invoke x ())))'


module.exports = MyASTs
