teascript
=========
[![Build
Status](https://travis-ci.org/alexschneider/teascript.svg?branch=as%2Ftravis)](https://travis-ci.org/alexschneider/teascript)
[![Coverage
Status](https://coveralls.io/repos/alexschneider/teascript/badge.svg)](https://coveralls.io/r/alexschneider/teascript)

Check out our wiki: https://github.com/alexschneider/teascript/wiki/1)-Ideas-for-Language

![](https://raw.githubusercontent.com/alexschneider/teascript/master/teascript_logo.jpg)

teascript is a very high level language that compiles into JavaScript.
More introduction is needed here...

### Features

#### Comments

Like most programming languages, teascript has **comments**. Single line
comments are created with an octothorpe/hashtag/tic-tac-toe arena (#).
Multiline comments begin and end with double octothorpes.

```
# This is a single line comment. Everything up to the newline doesn't count.

## This line is part of the multiline comment.
   So is this one.



   This one too.

   This is where the multiline comment ends. ##

## This is a multiline comment on a single line. ##

```

#### Primitive and Reference Types

Unlike JavaScript, we don't have a variable declaration keyword like `var`.
Unlike Python, we make a distinction between variable declaration and mutation.
Additionally, variables must be assigned a value when they are declared.

```
# We use := to declare variables.
# When we declare variables we can optionally specify their type.
x : int = 420
y := 'MLG status'  # We also allow for type inference.

# We use the = operator to mutate variables
x = 127001 # x has been defined, so it's cool
z = 42     # Hey z wasn't declared! This causes error.
```

We have four primitive types: `int`, `double`, `bool`, and `none`, our
"undefined"/"null" data type. Note that our primitive types are **ALL**
lowercase. We also have 5 reference types: `String`,`Lists`,`Maps`,`Sets`, and
`Tuples`. Note that the reference types all begin with an **uppercase** letter.
We demonstrate how to create these types.

```
x := 4               # Inferred to be an int
y := 3.14            # Inferred to be a double
is_this_true = false # Inferred to be a bool
z := none            # You can assign none to a variable

my_string = "Oh baby!" # This is a string literal
my_list = [1..5]       # This is a list, which is mutable.
my_tuple = (1,2,3,2,1) # Immutable ordered lists
my_set = <1,3,5,7>     # Immutable unordered lists with NO REPEATS
my_map = {"lat":51.24,"long":0.18}  # Ordered pair of key-values

```

#### Ranges and Slices for iterables
A range is a list of integers at a regularly spaced interval, bounded by x
inclusive on the low side, and y exclusive on the high side, I.E. `[x, y)`. A
range can be describe in two ways:

```
a .. b       # We go from a to b-1 in increments of 1.
# OR
a .. b by x  # We go from from a to b-1 in increments of x.

1 .. 10       # This is [1,2,3,4,5,6,7,8,9]
2 .. 10 by 2  # This is [2,4,6,8]
1 .. 15 by 4  # This is [1,5,9,13]. The next numeber is
              # 17, which is bigger than 17, so we finish
              # our list at 13.
```

A slice is a 1 to 1 mapping of a range to an ordered collection of elements,
such that the index of an element in a slice corresponds to a number given by
the range. This means that we use a range to select a specific subset of the
elements of an ordered iterabele. All reference types are iterables. All
reference types except sets are ordered iterables. Since they are ordered, we
can iterate over them in a predictable way and apply slices to them.  

```
instrument := "xylophone"
instrument[0,1,2]        # We grab "xyl"
instrument[0..3]         # Since [0..3] == [0,1,2] this is also "xyl"
instrument[0..8 by 3]    # We grab "xoo"

```

#### Assignments and Mutations Are Expression

In teascripts, variable declarations and mutations are expressions.

```
x := 100     # We declare x and assign it the value of 10

y := (x = 4) # We assign the value of 4 to x. Since assignemnts
             # are expressions, we return a value of 4, which gets
             # assigned to y.

z := (y = (x = 2) + 4) + 10

# x = 2, y = 6, and z = 16.
```

#### Control Flow
Variables assignments and mutations only get you so far. That's why we have
`if`s, `for`s, `while`s and functions.

#### Ifs

`if`s are conditional expressions. Like variable declarations and mutations,
conditional expressions return values. In our language, `if`s return whatever
the last expression in the body of the `if` evaluated to. In some cases an `if`
statement will evaluate to `none`.

```
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
#### for Loops
In teascript we can iterate over anything that is an iterable. Of our five
reference types, only four of them are ordered, ie lists, tuples, strings, and
maps(we iterate over their keys in lexicographical order). Sets are unordered
iterables, so while iterating over them is allowed, do not expect an explicit
ordering when iterating over them.

```
# We can give the for loop a variable that is
# a reference to an iterable or pass an
# iterable.

cum_sum := 0
for i in [1,2,3,4]:
    cum_sum += i
    out(cum_sum)
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
  return iterations if starting == 1
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

#### Objects
Objects behave like maps with slightly different syntax (and they can be
instantiated more than once)
```
O := obj:                                   var O = function() {
  a := () -> "hello"                          this.a = function() { return "hello"; };
  b := 5                                      this.b = 5;
end                                         };

o := new O()                                var o = new O();
out(o.a());                                 console.log(o.a());
out(o.b);                                   console.log(o.b());
```
