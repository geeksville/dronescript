
enum MAVType {
    GPS_POSITION
}

class MAVLinkMessage {

    constructor(b = null) {
		if(b != null) {
			local start = b.readn('b') 
      		local payloadLen = b.readn('b')
        	seq = b.readn('b')
        	sysId = b.readn('b')
        	componentId = b.readn('b')
        	messageId = b.readn('b')
		}
    }

    seq = 0
    sysId = 0
    componentId = 0
    messageId = 0

    function pack() {
      	local b = blob(64) // FIXME, prereserve correct size

		b.writen(0xfe, 'b')
	    b.writen(0, 'b') // payloadLen
        b.writen(seq, 'b')
        b.writen(sysId, 'b')
        b.writen(componentId, 'b')
        b.writen(messageId, 'b')

        local pos = b.tell()
        writePayload(b)
        local payloadLen = b.tell() - pos
        b[1] = payloadLen

        // FIXME calc CRC
        b.writen(0, 'b') // LSB
        b.writen(0, 'b') // MSB

		// Shrink down to # of bytes actually used
		b.resize(b.tell())

	    return b
    }

    function _tostring() {
		return format("%s: seq=%d, sysId=%d, compId=%d", classname, seq, sysId, componentId)
	}

	static classname = "MAVLinkMessage"

    // Do not call directly, subclasses to override
	function writePayload(b) {
    }
}

class GPSPositionMessage extends MAVLinkMessage {

    constructor(b = null) {
        base.constructor(b)

    	if(b != null) {
			lat = b.readn('f')
      		lon = b.readn('f')
		}
    }

    lat = 0
    lon = 0

    // Generates a blob containing the payload
	function writePayload(b) {
     	b.writen(lat,'f')
      	b.writen(lon,'f')
    }

/*
    function _tostring() {
	    local b = base._tostring()

		return format("%s lat=%f, lon=%f", b, lat, lon)
	}
*/

	static classname = "GPSPositionMessage"
}

print("loaded\n")
local testobj = GPSPositionMessage()
testobj.sysId = 5
testobj.lat = 124.5
print(testobj + "\n")
local b = testobj.pack()
print("packed: " + b.len() + "\n")
b.seek(0)
local obj2 = GPSPositionMessage(b)
print("unpacked: " + obj2 + "\n")
