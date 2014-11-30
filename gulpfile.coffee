gulp = require 'gulp'
concat = require 'gulp-concat'
stylus = require 'gulp-stylus'
jade = require 'gulp-jade'
reload = require 'gulp-livereload'
awatch = require 'gulp-autowatch'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
coffeeify = require 'coffeeify'
browserify = require 'browserify'

gulp.task 'coffee', ->
  bCache = {}
  b = browserify './webaudioPrac.coffee',
    debug: true
    interestGlobals: false
    cache: bCache
    extensions: ['.coffee']
  b.transform coffeeify
  b.bundle()
  .pipe source 'webaudioPrac.js'
  .pipe buffer()
  .pipe gulp.dest './'
  .pipe reload()

gulp.task 'jade', ->
  gulp.src './*.jade'
  .pipe jade()
  .pipe gulp.dest './'
  .pipe reload()

gulp.task 'stylus', ->
  gulp.src './*.styl'
  .pipe stylus()
  .pipe gulp.dest './'
  .pipe reload()

gulp.task 'watch', ->
  awatch gulp,
    jade: './**/*.jade'
    stylus: './*.styl'
    coffee: './*.coffee'

gulp.task 'default', ['coffee', 'jade', 'stylus', 'watch']