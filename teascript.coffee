#!/usr/bin/env coffee

argv = require 'yargs'
  .usage '$0 filename'
  .demand 1
  .argv

scan = require './scanner/scanner'

scan argv._[0], (err, tokens) ->
  console.log err if err
  console.log tokens
