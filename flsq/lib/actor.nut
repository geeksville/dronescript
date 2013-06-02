

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

    function constructor() {
	queue = MessageQueue()

	coro = newthread(receiveThread)
	coro.call() // Start the coroutine
    }

    function sendTo(msg) {
	queue.enqueue(msg)
    }

    // Subclasses should override
    function receive(msg) {
	debug("Received: " + msg)
    }

    // 
    // Package methods
    //

    function perhapsWork() {
	if(coro.getstatus() != "suspended")
	    coro.wakeup()
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
		    return
		}
		else {
		    suspend(ACTOR_STAT_DID_WORK) 
		}
	    }
	    else {
		suspend(ACTOR_STAT_NO_WORK) 
	    }
	}
    }
}


// A ring buffer - burning one slot to make the code easy
class MessageQueue {
    arr = null
    start = 0
    end = 0

    function constructor(maxLen) {
	arr = array(maxLen + 1)
    }

    function isFull() {
	return (end + 1) % arr.len() == start
    }

    function isEmpty() {
	return end == start
    }

    function enqueue(msg) {
	if(isFull)
	    throw QueueFullException()

	arr[end] = msg
	end = (end + 1) % arr.len()
    }
    
    // Returns null if empty
    function dequeue() {
	if(isEmpty)
	    throw QueueEmptyException()

	local r = arr[start]
	start = (start + 1) % arr.len()
	return r
    }

    function size() {
	return arr.len() - 1
    }
}

class Scheduler {
    actors = []

    //
    // Private methods follow
    //

    function runNext() {
	// Kind of inefficient, we wake up every actor - if it has something
	// in its queue it will do some work
	foreach(a in actors) {
	    a.perhapsWork()
	}
    }
}