#!/usr/bin/env node
'use strict';

// Provide a title to the process in `ps`
process.title = 'sane';

var path = require('path');
var resolve = require('resolve');

//transforms all following require's to parse ES6/7 code
require('traceur').require.makeDefault(function(filename) {
  // don't transpile our dependencies, just our app
  //The first check is if you develop locally, the second for the globally installed module
  if (filename.indexOf('bin/sane') > -1) {
    return false;
  }
  //The first check is if you develop locally, the second for the globally installed moduel
  return (filename.indexOf('node_modules') === -1) ||
    (filename.indexOf(path.join('node_modules', 'sane-cli')) > -1 &&
      filename.indexOf(path.join('node_modules', 'sane-cli', 'node_modules')) === -1);
}, {asyncFunctions: true});

var cli;
resolve('sane-cli', {
  basedir: process.cwd()
}, function(error, localCliPath){
  var cli;
  if (error) {
    //require global sane-cli
    cli = require(path.join('..', '..', 'lib', 'cli'));
  } else {
    cli = require(path.join(localCliPath, '..', '..', 'lib', 'cli'));
  }
  cli(process.argv);
});
