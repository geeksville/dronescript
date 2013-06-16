

// A _private_ gateway interface to the native code provided by the platform (FIXME, could be removed someday
// and made entirely native.  
// Used only by Scheduler and (FIXME)
OSAgent <- {

    /// Wait for an event from the OS, possibly blocking our thread for
    /// up to timeoutMsec.  Returns null for timeout or the message blob
    waitMessage = function(timeoutMsec) {
	// PROVIDED BY NATIVE CODE - should presumably wait on a mailbox 
	// or somesuch.
	print("Calling wait\n")
	local r = os_waitMessage(timeoutMsec)
	print("Wait returned " + r + "\n")
	return r
    }

    /// mavMsg must be a blob of bytes to send 
    sendMavlink = function(mavMsg) {
	// PROVIDED BY NATIVE CODE
	print("Calling send " + mavMsg + "\n")
	os_sendMavlink(mavMsg)
    }
}