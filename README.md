teascript
=========
[![Build
Status](https://travis-ci.org/alexschneider/teascript.svg?branch=as%2Ftravis)](https://travis-ci.org/alexschneider/teascript)
[![Coverage
Status](https://coveralls.io/repos/alexschneider/teascript/badge.svg)](https://coveralls.io/r/alexschneider/teascript)

Check out our wiki: https://github.com/alexschneider/teascript/wiki/1)-Ideas-for-Language

![](https://raw.githubusercontent.com/alexschneider/teascript/master/teascript_logo.jpg)

teascript is a very high level language that compiles into JavaScript. More introduction is needed here...

#### Features 

#### Comments

Like most programming languages, teascript has **comments**. Single line comments are created with an octothorpe/hashtag/tic-tac-toe arena (#). Multiline comments begin and end with double octothorpes.

```
# This is a single line comment. Everything up to the newline doesn't count.

## This line is part of the multiline comment.
   So is this one.
   
   
   
   This one too.
   
   This is where the multiline comment ends. ##
   
## This is a multiline comment on a single line. ##

```

#### Primitive Types

Unlike JavaScript, we don't have a variable declaration keyword like `var`. Unlike Python, we make a distinction between variable declaration and mutation. Additionally, variables must be assigned a value when they are declared.

``` 
# We use := to declare variables.
# When we declare variables we can optionally specify their type.
x : int = 420
y := 'MLG status'  # We also allow for type inference.

# We use the = operator to mutate variables
x = 127001 # x has been defined, so it's cool
z = 42     # Hey z wasn't declared! This causes error.
```

We have four primitive types: `int`, `double`, `bool`, and `none`, our "undefined"/"null" data type. Note that our primitive types are **ALL** lowercase. We also have 5 reference types: `String`,`Lists`,`Maps`,`Sets`, and `Tuples`. Note that the reference types all begin with an **uppercase** letter. We demonstrate how to create these types.

```
x := 4               # Inferred to be an int
y := 3.14            # Inferred to be a double
is_this_true = false # Inferred to be a bool
z := none            # You can assign none to a variable 

my_string = "Oh baby!" # This is a string literal
my_list = [1..5]       # This is a list, which is an array.
my_tuple = (1,2,3,2,1) # Immutable ordered lists
my_set = <1,3,5,7>     # Immutable unordered lists with NO REPEATS
# Ordered pair of key-values
my_map = {"lat":51.24,"long":0.18} 
```
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
Variables assignments and mutations only get you so far. That's why we have `if`s, `for`s, `while`s and functions.

##### Ifs

`if`s are conditional expressions. Like variable declarations and mutations, conditional expressions return values. In our language, `if`s return whatever the last expression in the body of the `if` evaluated to. In some cases an `if` statement will evaluate to `none`.

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


```

```

