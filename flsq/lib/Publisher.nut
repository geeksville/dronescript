
/// An object that keeps a list of subscribing actors, sending them any messages they are interested
/// in
class Publisher {
    
    subscribers = null

    constructor() {
	subscribers = []
    }

    /// Register an actor as interested in subscribing to mavlink messages
    /// isInterested is a function that should return true if you want to see the specified message
    function subscribe(actor, isInterested = @(msg) true) {
	local p = {
	    a = actor
	    fn = isInterested
	}

	subscribers.append(p)
    }

    function unsubscribe(actor) {
	subscribers = subscribers.filter(@(i, v) v.a == actor)
    }

    function publish(msg, from = null) {
	foreach(val in subscribers)
	    if(val.a != from && val.fn(msg)) { // Interested and not the sender?
	        debug("Sending msg to interested actor: " + msg)
		val.a.sendTo(msg)
	    }
    }
}
