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

Like most programming languages, teascript has **comments**. Single line comments are created with an octothorpe/hashtag/tic-tac-toe arena (#). Multiline comments begin and end with double octothorpes.

```
# This is a single line comment. Everything up to the newline doesn't count.

## This line is part of the multiline comment.
   So is this one.
   
   
   
   This one too.
   
   This is where the multiline comment ends. ##
   
## This is a multiline comment on a single line. ##

```
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

Variables assignments and mutations only get you so far. That's why we included 

