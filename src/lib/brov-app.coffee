Bus = require('../../brov-bus/')

bus = new Bus 'zmq', 'blueROV-bus'

pub = bus.registerPublisher()

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
  
pub.send("TEST 1")
pub.send("TOTO 2")
pub.send("TITI 3")


# availableDevices = [
#   dummyDevice1:
#     model: 'tagadasinger'
#     id: 'tagadasinger-1'
#   dummyDevice2:
#     model: 'tagadasinger'
#     id: 'tagadasinger-2'
#   dummyDevice3:
#     model: 'tagadalistener'
#     id: 'tagadalistener-1'
# ]

# bus.registerDevices availableDevices
