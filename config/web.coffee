# Dependency

path = require 'path'
http = require 'http'

# Application

app = require path.resolve 'config', 'app'

# HTTP Server

server = http.createServer(app).listen (process.env.PORT || 3000), ->
  console.log "Express server listening on port #{process.env.PORT || 3000}"

# Socket.IO

io = require("socket.io").listen server
linda = require("linda-socket.io").Linda.listen({io: io, server: server})
