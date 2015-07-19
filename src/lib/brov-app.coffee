# TODO: FIX DEPENDENCIES
try
  Bus = require('@jilpi/brov-bus')
catch
  Bus = require('../../brov-bus')

# Create a new bus
bus = new Bus 'zmq', 'blueROV-bus'

# Create and bind a publisher
pub = bus.registerPublisher()

# Create and bind 4 diffent subscribers (for test purpose)
bus.registerSubscriber ((msg)->
  console.log "No filter: #{msg.toString()}")

bus.registerSubscriber ((msg)->
  console.log "TEST filter: #{msg.toString()}")
  , ["TEST"]
  
bus.registerSubscriber ((msg)->
  console.log "TEST/TOTO filter: #{msg.toString()}")
  , ["TEST", "TOTO"]

bus.registerSubscriber ((msg)->
  console.log "TOTO filter: #{msg.toString()}")
  , ["TOTO"]

console.log "send messages in a loop"

i = 0

setInterval(->
    pub.send("TEST", i++)
    pub.send("TOTO", i++)
    pub.send("TITI", i++)
    pub.send("", i++)
    return
  ,2000)