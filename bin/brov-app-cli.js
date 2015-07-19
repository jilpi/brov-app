#!/usr/bin/env node

// inspired from https://github.com/npm/npm/blob/master/bin/npm-cli.js
;(function () { // wrapper in case we're in module_context mode
  // windows: running "npm blah" in this folder will invoke WSH, not node.
  /*global WScript*/
  if (typeof WScript !== 'undefined') {
    WScript.echo(
      'npm does not work when run\n' +
        'with the Windows Scripting Host\n\n' +
        "'cd' to a different directory,\n" +
        "or type 'npm.cmd <args>',\n" +
        "or type 'node npm <args>'."
    )
    WScript.quit(1)
    return
  }
  
  require '../lib/brov-app.js'
}