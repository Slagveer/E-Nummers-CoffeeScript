fs            = require 'fs'
{exec, spawn} = require 'child_process'
console.log 'STARTED'
try
  which = require('which').sync
catch err
  if process.platform.match(/^win/)?
    console.log 'WARNING: the which module is required for windows\ntry: npm install which'
  which = null

# order of files in `inFiles` is important
config =
  srcDir:  'js/src'
  outDir:  'js'
  inFiles: [
    'AppConstants'
    'model/proxy/TwitterProxy'
    'model/proxy/FaceBookProxy'
    'model/proxy/EnummersProxy'
    'model/component/CategoryModel'
    'model/component/SoortModel'
    'model/component/ResultModel'
    'model/component/SearchModel'
    'model/component/StatusModel'
    'model/component/FaceBookModel'
    'model/component/TwitterModel'
    'view/event/AppEvents'
    'view/component/TodoForm'
    'view/component/LogoView'
    'view/component/CategorieenView'
    'view/component/SoortenView'
    'view/component/ResultView'
    'view/component/SearchView'
    'view/component/StatusView'
    'view/component/FaceBookView'
    'view/component/TwitterView'
    'view/mediator/RoutesMediator'
    'view/mediator/TodoFormMediator'
    'view/mediator/LogoViewMediator'
    'view/mediator/CategorieenViewMediator'
    'view/mediator/SoortenViewMediator'
    'view/mediator/ResultViewMediator'
    'view/mediator/SearchViewMediator'
    'view/mediator/StatusViewMediator'
    'view/mediator/FaceBookViewMediator'
    'view/mediator/TwitterViewMediator'
    'controller/command/StartupCommand'
    'controller/command/PrepControllerCommand'
    'controller/command/PrepModelCommand'
    'controller/command/PrepViewCommand'
    'controller/command/TodoCommand'
    'app'
  ]
  outFile: "main"

console.log "#{config.outDir}/#{config.outFile}"

outJS = "#{config.outDir}/#{config.outFile}"
files = ("#{config.srcDir}/#{file}.coffee" for file in config.inFiles)

# tasks
task 'build', 'compile source', -> build -> min -> log 'build done', green

task 'watch', 'compile and watch', -> build true, -> log ":-)", green

task 'test', 'run tests', -> build -> mocha -> log ":)", green


# ANSI Terminal Colors
bold = '\x1b[0;1m'
green = '\x1b[0;32m'
reset = '\x1b[0m'
red = '\x1b[0;31m'

# Write log message
log = (message, color, explanation) -> console.log color + message + reset + ' ' + (explanation or '')

# Launch external command
launch = (cmd, options=[], callback) ->
  cmd = which(cmd) if which
  app = spawn cmd, options
  app.stdout.pipe(process.stdout)
  app.stderr.pipe(process.stderr)
  app.on 'exit', (status) -> callback?() if status is 0

build = (watch, callback) ->
  if typeof watch is 'function'
    callback = watch
    watch = false

  options = ['-c', '-b', '-j', "#{outJS}.js"]
  options = options.concat files
  options.unshift '-w' if watch
  launch 'coffee', options, callback

min = (callback) ->
  options = ['-o', "#{outJS}.min.js", "#{outJS}.js"]
  launch 'uglifyjs', options, callback

mocha = (options, callback) ->
  #if moduleExists('mocha')
  if typeof options is 'function'
    callback = options
    options = []
  # add coffee directive
  options.push '--compilers'
  options.push 'coffee:coffee-script'

  launch 'mocha', options, callback
