
dofile("lib/log.nut", true)
dofile("lib/collection.nut", true)
dofile("lib/OSAgent.nut", true)
dofile("lib/Exception.nut", true)
dofile("lib/MessageQueue.nut", true)
dofile("lib/Actor.nut", true)
dofile("lib/Publisher.nut", true)
dofile("lib/Mavlink.nut", true)
dofile("lib/Scheduler.nut", true)

dofile("mavbase.nut", true)
// dofile("mavgened.nut", true)
dofile("gen/generated.nut", true)

// writeclosuretofile("asbytes",loadfile("nout.nut", true))



/// Actors who want to impelement message receivers can use this as an example
class MavlinkReceiver extends Actor {
    constructor() {
	base.constructor()

	Mavlink.subscribe(this)
    }

    function receive(msg) {
	debug("RA received: " + msg)

	local b = msg.toBlob()
	print("packed: " + mkString(b, ",") + "\n")
	b.seek(0)
	local obj2 = MAV.Message.fromBlob(b)
	print("unpacked: " + obj2 + "\n")
    }
}

local mr = MavlinkReceiver()

print("pretending to receive a message - FIXME add publishing foo\n")
local testobj = MAV.Message.create(MAV.MSG_HWSTATUS)
testobj.sysId = 5
testobj.Vcc = 124.5
OSAgent.sendMavlink(testobj.toBlob())
mr.sendTo(testobj)
// print(testobj + "\n")

Scheduler.run()

