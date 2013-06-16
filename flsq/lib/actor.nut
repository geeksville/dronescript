

class Exception {
}

class QueueEmptyException extends Exception {}
class QueueFullException extends Exception {}

class Message {
}

class PoisonPill extends Message {
}

const ACTOR_STAT_NO_WORK = 0
const ACTOR_STAT_DID_WORK = 1
const ACTOR_STAT_EXITED = 2

class Actor {
    coro = null
    queue = null

    constructor() {
	queue = MessageQueue(8)

	// Bundle up this for the thread method
	local fn = receiveThread.bindenv(this)
	coro = newthread(fn)
	coro.call() // Start the coroutine

	Scheduler.actors.push(this)
    }

    function sendTo(msg) {
	queue.enqueue(msg)
	debug("Sent " + msg + " to " + this)
    }

    // Subclasses should override
    function receive(msg) {
	debug("Received: " + msg)
    }

    // 
    // Package methods
    //

    // Returns ACTOR_STAT_x
    function perhapsWork() {
	if(coro.getstatus() == "suspended")
	    return coro.wakeup()
	else
	    return ACTOR_STAT_EXITED
    }

    //
    // Private methods
    // 

    function receiveThread() {
	while(true) {
	    if(!queue.isEmpty()) {
		local msg = queue.dequeue()
		receive(msg)
	
		if(msg instanceof PoisonPill) {
		    info("Exiting actor\n")
		    return ACTOR_STAT_EXITED
		}
		else 
		    suspend(ACTOR_STAT_DID_WORK) 
	    }
	    else 
		suspend(ACTOR_STAT_NO_WORK) 
	}
    }
}


// A ring buffer - burning one slot to make the code easy
class MessageQueue {
    arr = null
    start = 0
    end = 0

    constructor(maxLen) {
	arr = array(maxLen + 1)
    }

    function isFull() {
	return (end + 1) % arr.len() == start
    }

    function isEmpty() {
	return end == start
    }

    function enqueue(msg) {
	if(isFull())
	    throw QueueFullException()

	arr[end] = msg
	end = (end + 1) % arr.len()
    }
    
    // Returns null if empty
    function dequeue() {
	if(isEmpty())
	    throw QueueEmptyException()

	local r = arr[start]
	start = (start + 1) % arr.len()
	return r
    }
}

Scheduler <- {
    //
    // Package private
    //

    actors = []

	run = function() {
		while(runOnce()) {
			// FIXME - we should wait forever
			local blob = OSAgent.waitMessage(5000)
			
			if(blob != null) {
				debug("Got blob! " + blob + "\n")
				local msg = MAV.Message.fromBlob(blob)
				debug("Got msg! " + msg + "\n");
			}
		}
	}

    // Run for as long as there was work able to be done
    // return false if all actors have exited
    runOnce = function() {
	local allexited = true
	local didwork = false
	local todelete = []

	do {
	    didwork = false

	    // FIXME Kind of inefficient, we wake up every actor - if it has something
	    // in its queue it will do some work
	    foreach(i, a in actors) {
		local status = a.perhapsWork()
		debug("Actor " + a + " returned " + status)

		if(status == ACTOR_STAT_DID_WORK)
		    didwork = true

		if(status != ACTOR_STAT_EXITED)
		    allexited = false
		else
		    todelete.push(i)
	    }

	    // Delete any dead actors
	    while(todelete.len() > 0) {
		local i = todelete.pop()
		debug("Removing dead actor " + i)
		actors.remove(i)
	    }
	}
	while(didwork)

	return !allexited
    }
}