teascript
=========
[![Build
Status](https://travis-ci.org/alexschneider/teascript.svg?branch=as%2Ftravis)](https://travis-ci.org/alexschneider/teascript)
[![Coverage
Status](https://coveralls.io/repos/alexschneider/teascript/badge.svg)](https://coveralls.io/r/alexschneider/teascript)

![](https://raw.githubusercontent.com/alexschneider/teascript/master/teascript_logo.jpg)

teascript is a gorgeous little language that compiles into JavaScript. teascript is expressive and powerful, allowing you to not only do exactly what you want, but do so in a clear and concise manner.



## Install
  
    $ git clone https://github.com/alexschneider/teascript
    $ cd teascript
    
####Test

    $ npm test
    
####Execute

    $ coffee teascript.coffee [-t] [-a] filename.tea

  - _t_ scans, prints the tokens, then exits
  - _a_ scans, parses, prints the abstract syntax tree, then exits

### Grammar
#### Microsyntax

The rules here are _ordered_. Matches are attempted from top to bottom.
```
newline    ::= \s* (\r*\n)+
letter     ::= [a-zA-Z]
digit      ::= [0-9]
keyword    ::= 'class' | 'trait' 
             | 'for' | 'in' | 'by' | 'while' | 'end' 
             | 'and' | 'or' | 'is' | 'isnt' 
             | 'if'  | 'else' 
             | 'not' | 'true' | 'false'
             | 'new' | 'return'
id         ::= (letter | '_') (letter | digit | '_')*
intlit     ::= digit+
floatlit   ::= digit+ '.' digit+ ([Ee] [+-]? digit+)?
relop      ::= '<' | '<=' | 'is' | 'isnt' | '>=' | '>'
addop      ::= '+' | '-'
mulop      ::= '*' | '/' | '%'
prefixop   ::= '-' | 'not'
boollit    ::= 'true' | 'false'
nonelit    ::= 'none'
escape     ::= [\\] ([rnst'"\\] 
char       ::= [^\x00-\x1F'"\\] | escape
stringlit  ::= ('"' char* '"') | (\x27 char* \x27)
comment    ::= '#' [^\n]* newline
             | '##' .*? '##'

```
#### Macrosyntax
```
Program        ::= Block
Block          ::= (Stmt newline)*

Stmt           ::= 'while' Exp ':' (newline Block 'end' | Exp)
               | 'for' id 'in' Exp ':' (newline Block 'end' | Exp)
               | ReturnStmt
               | Exp

ReturnStmt     ::= 'return' Exp

Exp            ::= VarDeclaration
               | VarAssignment
               | TernExp
               | ConditionalExp
               | FunctionExp
               | TraitExp
               | ClassExp

VarDeclaration ::= (id|TupLit) ':=' Exp
VarAssignment  ::= VarExp '=' Exp
VarExp         ::= id ( ('.' Exp8 
                        | '[' Exp3 ']' 
                        | (Args ('.' Exp8 | '[' Exp3 ']')) )*

ConditionalExp ::= 'if' Exp0 ':' newline Block ('else if' Exp0 ':' newline Block)* ('else:' newline Block 'end')?
                 | 'if' Exp0 ':' Exp

TernExp        ::=  Exp0 ('if' Exp0 ('else' TernExp)?)?
Exp0           ::=  Exp1 ('or' Exp1)*
Exp1           ::=  Exp2 ('and' Exp2)*
Exp2           ::=  Exp3 (relop Exp3)?
Exp3           ::=  Exp4 (('..'|'...') Exp4 ('by' Exp4)?)?
Exp4           ::=  Exp5 (addop Exp5)*
Exp5           ::=  Exp6 (mulop Exp6)*
Exp6           ::=  prefixop? Exp7
Exp7           ::=  Exp8 ('**' Exp6)?
Exp8           ::=  Exp9 ('.' Exp9 | '[' Exp3 ']' | Args)*
Exp9           ::=  boollit | intlit | floatlit | id | '(' Exp ')' | stringlit
                 | TupLit | SetLit | MapLit | ListLit | nonelit

ExpList        ::= newline? Exp (newline? ',' Exp)* newline?

Args           ::= '(' ExpList ')'
Params         ::= '(' ExpList ')'

TupLit         ::= '|' ExpList? '|'
SetLit         ::= '<' ExpList? '>'
ListLit        ::= '[' ExpList? ']'
MapLit         ::= '{' BindingList? '}'
Binding        ::= newline? id ':' Exp newline?
BindingList    ::= Binding (',' Binding)*

Comprehension  ::= '[' TernExp 'for' id 'in' Exp ']'

PropSignature  ::= id (Params)?

TraitExp       ::= 'trait:' newline (PropSignature newline)* 'end'
ClassExp       ::= 'class:' newline (Exp newline)* 'end'
FunctionBlock  ::= Exp | (newline Block 'end')
FunctionExp    ::= Params '->' FunctionBlock
```

### Features

#### Comments

Single line comments are created with an octothorpe/hashtag/tic-tac-toe arena (`#`).
Multiline comments begin and end with double octothorpes.

```
# This is a single line comment. Everything up to the newline doesn't count.

## This line is part of the multiline comment.
   So is this one.



   This one too.

   This is where the multiline comment ends. ##

## This is a multiline comment on a single line. ##

```
#### Assignment and Mutation

Unlike JavaScript, we don't have a variable declaration keyword like `var`.
Unlike Python, we make a distinction between variable declaration and mutation.
Additionally, variables must be assigned a value when they are declared.

```ruby
# We use := to declare variables.
x := 420
y := 'MLG status' 

# We use the = operator to mutate variables
x = 127001 # x has been defined, so it's cool
z = 42     # Hey z wasn't declared! This causes error.
```
#### Primitive and Reference Types

We have four primitive types: `int`, `double`, `bool`, and `none`, our
"undefined"/"null" data type. Note that our primitive types are **ALL**
lowercase. We also have 5 reference types: `String`,`List`,`Map`,`Set`, and
`Tuple`. Note that the reference types all begin with an **uppercase** letter.
We demonstrate how to create these types.

```ruby
x := 4                                # Inferred to be an int
y := 3.14                             # Inferred to be a double
is_this_true := false                 # Inferred to be a bool
z := none                             # You can assign none to a variable

my_string := "Oh baby!"               # This is a string literal
my_list := [1..5]                     # This is a list, which is mutable.
my_tuple := (1,2,3,2,1)               # Immutable ordered lists
my_set := <1,3,5,7>                   # Immutable unordered lists with NO REPEATS
my_map := {"lat":51.24,"long":0.18}   # Ordered pair of key-values

```

#### Ranges and Slices for iterables
A range is a list of integers at a regularly spaced interval, bounded by x
inclusive on the low side, and y exclusive (with 2 dots ```..```) on the high side, i.e. `[x, y)`. With 3 dots ```...```, both x and y are inclusive, i.e. `[x, y]`. For example:

```ruby
a .. b         # We go from a to b-1 in increments of 1.
a .. b by x    # We go from from a to b-1 in increments of x.

1 .. 10        # This is [1,2,3,4,5,6,7,8,9]
1 ... 10       # This is [1,2,3,4,5,6,7,8,9,10]
2 .. 10 by 2   # This is [2,4,6,8]
2 ... 10 by 2  # This is [2,4,6,8,10]
1 .. 15 by 4   # This is [1,5,9,13]
```

A slice is a one-to-one mapping of a range to an ordered collection of elements,
such that the index of an element in a slice corresponds to a number given by
the range. This means that we use a range to select a specific subset of the
elements of an ordered iterabele. All reference types are iterables. All
reference types except sets are ordered iterables. Since they are ordered, we
can iterate over them in a predictable way and apply slices to them.

```ruby
instrument := "xylophone"
instrument[0,1,2]        # We grab "xyl"
instrument[0..3]         # Since [0..3] == [0,1,2] this is also "xyl"
instrument[0..8 by 3]    # We grab "xoo"
```

#### Assignments and Mutations are Expressions

In teascript, variable declarations and mutations are expressions.

```ruby
x := 100       # We declare x and assign it the value of 10

y := (x = 4)   # We assign the value of 4 to x. Since assignemnts
               # are expressions, we return a value of 4, which gets
               # assigned to y.

z := (y = (x = 2) + 4) + 10

# x = 2, y = 6, and z = 16.
```

#### Control Flow
Variable assignments and mutations only get you so far. That's why we have
`if`, `for`, `while` and functions.

#### Ifs

`if`s are conditional expressions. Like variable declarations and mutations,
conditional expressions return values. In our language, `if`s return whatever
the last expression in the body of the `if` evaluated to. In some cases an `if`
statement will evaluate to `none`.

```ruby
# We have several syntaxes for ifs.
# 1) expression1 if condition else expression2

i_am_ready := false
message := "Let's go!" if i_am_ready else "We gotta wait..."

# message has a string that says "We gotta wait..."

message := "Let's go!" if (i_am_ready = !i_am_ready) else "We gotta wait..."

# i_am_ready is now true and the message reads "Let's go!"

# 2) if condition: expression
## This is similar to the previous form, except that when
   when we don't provide an alternate expression, the if
   evaluates to non
##

x := true
y := if x: 10 + 33 # y is now 43

x = false          # since the condition is false
z := if x: 4*5     # the if statement returns none

# 3) if blocks
## These contain the typical if-else if-else
   structure. We indicate the end of a block
   if with the keyword 'end'
##

if i_am_ready:
    out("I'm ready.")
    counter++
else if almost_ready:
    out("I'm almost ready.")
else
    out("Come back some other time.")
end
```
#### For Loops
In teascript we can iterate over anything that is an iterable. Of our five
reference types, only four of them are ordered, ie lists, tuples, strings, and
maps (we iterate over their keys in lexicographical order). Sets are unordered
iterables, so while iterating over them is allowed, do not expect an explicit
ordering when iterating over them.

```ruby
# We can give the for loop a variable that is
# a reference to an iterable or pass an
# iterable.

sum := 0
for i in [1,2,3,4]:
    sum += i
    out(sum)
end

new_str := ""
for letter in "xylophones"[0..9 by 3]:
    new_str +=letter
end
out(new_str)  # prints out "oos"

## You won't know in what order the strings will be
   printed because sets are unordered iterables. However,
   each color will be printed once.
##
for color in <"red","yellow","green","blue">:
    out(color)
end
```

#### while loops
While loops can be used one of two ways.

```ruby
# If the while loop has a single expression in its
# body it can be written into a single line.
counter := 0
while counter < 28: out(counter+=)

# Otherwise, we apply the traditional model. Don't forget
# the 'end' at the bottom!

counter = 10
while counter > 0:
    out(counter-=1)
end
out('Happy New Year!')
```

#### Functions

Functions in teascript look a lot like the functions in CoffeeScript. Functions are
first-class objects.

```
repeat = (str, n) ->
    new_str := ""
    for i in 1..n:
        new_str += str
    end
    return new_str
end

# We can also have anonymous functions.
times((x) -> 2*x, 5, 10)
```

### Example Programs

teascript on left, JavaScript on right.
#### Hello World

```
out('Hello World')                          console.log('Hello World');
```

#### Variable declarations
```
x := 'Xylophones'                           var x = 'Xylophones';
```

#### Functions
##### teascript
```
collatz := (starting, iterations:=0) ->
  if starting == 1: return iterations 
  new_num := starting / 2 if starting % 2 == 0 else starting * 3 + 1
  return collatz(new_num, ++iterations) # The return is optional, but encouraged
end
```
##### JavaScript
```js
var collatz = function(starting, iterations) {
    iterations = iterations || 0;
    if (starting == 1) {
        return iterations;
    }
    var new_num;
    if (starting % 2 == 0) {
        new_num = starting / 2;
    } else {
        new_num = starting * 3 + 1;
    }
    return collatz(new_num, ++iterations);
}
```

#### Traits
```
iterable := trait:                          var iterable = {
  next()                                      trait: true,,
  has_next()                                  next: 'function',
end                                           has_next: 'function'
                                            };
ordered_iterable := trait:                  var ordered_iterable = {
  implements iterable                           implements: [iterable],
  index                                         index: 'property'
end                                         };


x := # some variable                        var x = // some variable
                                            var $check_trait = function(obj, trait) {
y:= x is iterable                             for (x in iterable) {
                                                if (obj.hasOwnProperty(x) {
                                                  if (typeof obj.x == iterable[x]) {
                                                    continue;
                                                  }
                                                }
                                                return false;
                                              }
                                              return true;
                                            };
                                            y = $check_trait(x, iterable);

```

#### Parallel / destructuring assignment
```
(x, y, z) := (1, 2, 3)                      var x = 1, y = 2, z = 3;
f := () -> [0, 1, 2]                        var f = function() { return [0, 1, 2] };
(x, y, z) := f()                            var $xyz = f(), x = $xyz[0], y = $xyz[1], z = $xyz[2];
```

#### Classes / Objects
Objects behave like maps with slightly different syntax
```
Circle := class:                            var Circle = function() {
  r := 4                                      this.r = 4;
  circum := () -> 2*Math.PI*this.r            this.circum = function() { return 2*Math.PI.this.r; };
end                                         };

circle := new Circle()                      var circle = new Circle();
out(circle.r);                              console.log(circle.r);
out(circle.circum());                       console.log(circle.circum());
```
