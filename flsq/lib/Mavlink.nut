
/// Mavlink send/receive operations
Mavlink <- {

    /// Send a mavlink message (to the OS and to other squirrel widgets)
    send = function(msg, from = null) {

		// Deliver to local actors
		publisher.publish(msg, from)

		// Send to OS
		OSAgent.sendMavlink(msg.toBlob())
    }

    subscribe = function(actor) {
		publisher.subscribe(actor)
    }

    //
    // Private code follows
    //

    publisher = Publisher()

    /// Handle an inbound message from the vehicle
    /// Private method for use by Scheduler
    receiveFromOS = function(msg) {
		// Deliver to any actors
		publisher.publish(msg)
    }
}

