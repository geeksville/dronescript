
// FIXME - the following should be distributed as binaries, not text
libs <- ["lib/log.nut",
"lib/collection.nut", 
"lib/OSAgent.nut",
"lib/Exception.nut", 
"lib/MessageQueue.nut", 
"lib/Actor.nut",
"lib/Publisher.nut", 
"lib/Mavlink.nut", 
"lib/Scheduler.nut", 
"lib/mavbase.nut",
"gen/generated.nut" ]
foreach(f in libs)
    dofile(f, true)

// writeclosuretofile("asbytes",loadfile("nout.nut", true))



/// Actors who want to impelement message receivers can use this as an example
class MavlinkReceiver extends Actor {
    constructor() {
	base.constructor()

	Mavlink.subscribe(this)
    }

    function receive(msg) {
	debug("TestActor received: " + msg)

	//local b = msg.toBlob()
	//print("packed: " + mkString(b, ",") + "\n")
	//b.seek(0)
	//local obj2 = MAV.Message.fromBlob(b)
	//debug("unpacked: " + obj2 + "\n")
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

