#!/usr/bin/env coffee

argv = require 'yargs'
  .usage '$0 [-t] [-a] [-u] filename'
  .boolean ['t', 'a']
  .describe 't', 'show tokens after scanning then stop'
  .describe 's', 'show abstract syntax tree after parsing then stop'
  .describe 'a', 'show analyzed program after parsing and then stop'
  .describe 'g', 'generate and display the compiled code then stop'
  .describe 'u', 'uglify (minimize) the generated code'
  .demand 1
  .argv

scan = require './scanner/scanner'
parse = require './parser/parser'
generate = require './generators/jsgenerator'
uglify = require 'uglify-js'

scan argv._[0], (err, tokens) ->
  if err
    console.log err
    return
  if argv.t
    console.log tokens
    return
  try
    p = parse tokens
    if argv.s
      console.log "#{p}"
      return
    p.analyze()
    p = p.optimize()
    if argv.a
      console.log JSON.stringify p, null, 2
      return
    program = generate p
    if argv.u
      program = uglify.minify(program, {fromString: true}).code
    if argv.g
      console.log program
      return

  catch err
    console.log err.message
    throw err
    return
