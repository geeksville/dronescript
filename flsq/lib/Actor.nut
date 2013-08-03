

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



