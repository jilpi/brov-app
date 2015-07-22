# TODO: FIX DEPENDENCIES
try
  Bus = require('@jilpi/brov-bus')
catch
  Bus = require('../../brov-bus')

# Create a new bus
bus = new Bus 'zmq', 'blueROV-bus'

# Create and bind a publisher
pub = bus.getPublisher()

# Create and bind 4 diffent subscribers (for test purpose)
bus.registerSubscriber ((err, filter, message)->
  return if err?
  console.log "No filter: #{message} (#{filter})")

bus.registerSubscriber ((err, filter, message)->
  return if err?
  console.log "FOO filter: #{message} (#{filter})")
  , ["FOO"]
  
bus.registerSubscriber ((err, filter, message)->
  return if err?
  console.log "FOO/BAR filters: #{message} (#{filter})")
  , ["FOO", "BAR"]

bus.registerSubscriber ((err, filter, message)->
  return if err?
  console.log "BAR filter: #{message} (#{filter})")
  , ["BAR"]

console.log "send messages in a loop"

i = 0

setInterval(->
    pub.send("FOO", i++)
    pub.send("BAR", i++)
    pub.send("OTHER", i++)
    pub.send("", i++)
    return
  ,2000)