


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
		trace("Got blob! " + blob)
		local msg = MAV.Message.fromBlob(blob)
		debug("Got msg! " + msg)
		Mavlink.receiveFromOS(msg)
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