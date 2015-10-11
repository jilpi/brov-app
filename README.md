#brov-bus#
##Project##
Part of the "brov" project.

We are developping a submarine "ROV" (remotely operated vehicule) based on
[BlueRobotics' BlueROV][bluerov].

##Description##
This is the main application, run on the ROV itself. Installing it will install other npm modules as dependencies.

It provides all functionalities for the ROV to operate, as well as an html-based user interface.

Some notes about its architecture [here][googledoc].

Ready:
* Anonymous pub-sub bus

To do (by order of priority):

* A driver for BlueESC through I2C (quick testing)
* A driver for I2C sensors (OpenROV IMU £1 priority)
* A driver for XBox controller (local USB, quick testing)
* Navigation control module
* A level of abstraction to handle sensors and actuators (sensorjs?)
* I2C driver
* Motor control driver
* Data acquisition module
* Video stream over HTTP
* Camera control module
* HTML interface
* Emergency control module
* Drivers for other sensors (temperature, hull's internal pressure, etc.)


##Installation##
To install the latest version directly from github:

```bash
npm install https://github.com/jilpi/brov-app/archive/master.tar.gz
```

TODO: Publish the package on npmjs.org.

If you don't have it already, you should also have ZeroMQ 3 or 4 installed on your system.

On Debian / Raspbian / Ubuntu:
```bash
sudo apt-get install libzmq3-dev
```

##Usage##

TODO

##Principle##

TODO

##Documentation##
Documentation is generated automatically with [codo][codo] and can be found in the
/doc folder of the repository.

You can also check it online [here][doc] thanks to [Rawgit][rawgit].


[codo]: https://github.com/coffeedoc/codo
[zmq]: http://zeromq.org/
[events]: https://nodejs.org/api/events.html
[bluerov]: http://docs.bluerobotics.com/bluerov/
[brov-app]: https://github.com/jilpi/brov-app
[brov-bus]: https://github.com/jilpi/brov-bus
[doc]: https://cdn.rawgit.com/jilpi/brov-app/master/doc/index.html
[rawgit]: http://www.rawgit.com/
[googledoc]: https://goo.gl/u1XIN2
