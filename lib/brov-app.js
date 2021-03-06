// Generated by CoffeeScript 1.9.3
(function() {
  var Bus, bus, i, pub;

  try {
    Bus = require('@jilpi/brov-bus');
  } catch (_error) {
    Bus = require('../../brov-bus');
  }

  bus = new Bus('zmq', 'blueROV-bus');

  pub = bus.getPublisher();

  bus.registerSubscriber((function(err, filter, message) {
    if (err != null) {
      return;
    }
    return console.log("No filter: " + message + " (" + filter + ")");
  }));

  bus.registerSubscriber((function(err, filter, message) {
    if (err != null) {
      return;
    }
    return console.log("FOO filter: " + message + " (" + filter + ")");
  }), ["FOO"]);

  bus.registerSubscriber((function(err, filter, message) {
    if (err != null) {
      return;
    }
    return console.log("FOO/BAR filters: " + message + " (" + filter + ")");
  }), ["FOO", "BAR"]);

  bus.registerSubscriber((function(err, filter, message) {
    if (err != null) {
      return;
    }
    return console.log("BAR filter: " + message + " (" + filter + ")");
  }), ["BAR"]);

  console.log("send messages in a loop");

  i = 0;

  setInterval(function() {
    pub.send("FOO", i++);
    pub.send("BAR", i++);
    pub.send("OTHER", i++);
    pub.send("", i++);
  }, 2000);

}).call(this);
