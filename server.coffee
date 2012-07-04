express = require 'express'
app = express.createServer()

jade = require 'jade'
stylus = require 'stylus'

compile = (str,path) ->
  return stylus(str).set('filename',path).set('compress',true)

app.configure ->
  app.set 'views', __dirname+'/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use stylus.middleware {src:__dirname+'/views', dest:__dirname+'/public', compile:compile}
  app.use express.static __dirname+'/public'
  app.use app.router

require('./controllers/home.coffee')(app)

port = 8080
app.listen port
console.log "Server running on http://127.0.0.1:#{port}"
