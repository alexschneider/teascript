#!/usr/bin/env coffee

argv = require 'yargs'
  .usage '$0 [-t] [-a] filename'
  .boolean ['t', 'a']
  .describe 't', 'show tokens after scanning then stop'
  .describe 'a', 'show abstract syntax tree after parsing then stop'
#  .describe 'o', 'do optimizations'
#  .describe 'i', 'generate and show the intermediate code then stop'
  .demand 1
  .argv

scan = require './scanner/scanner'
parse = require './parser/parser'

scan argv._[0], (err, tokens) ->
  if err
    console.log err
    return
  if argv.t
    console.log tokens
    return
  try
    p = parse tokens
    if argv.a
      console.log "#{p}"
      return
  catch err
    console.log err.message
    return
