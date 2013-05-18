

function mkString(seq, separator = "") {
	local r = ""
	foreach(idx, val in seq) {
		if(idx != 0)
			r += separator

		r += val
	}

	return r
}

enum MAVLinkMessageID {
	INVALID,
    GPS_RAW_INT
}

class MAVLinkMessage {
	constructor() {}

	// Do not call directly, instead, call fromBlob
    function unpack(b) {
			local start = b.readn('b') 
      		local payloadLen = b.readn('b')
        	seq = b.readn('b')
        	sysId = b.readn('b')
        	componentId = b.readn('b')
        	messageId = b.readn('b')

			unpackPayload(b)
    }

    seq = 0
    sysId = 0
    componentId = 0
    messageId = 0

    function toBlob() {
      	local b = blob(64) // FIXME, prereserve correct size

		b.writen(0xfe, 'b')
	    b.writen(0, 'b') // payloadLen
        b.writen(seq, 'b')
        b.writen(sysId, 'b')
        b.writen(componentId, 'b')
        b.writen(messageId, 'b')

        local pos = b.tell()
        packPayload(b)
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
		return tostring()
	}

    function tostring() {
		return format("%s: seq=%d, sysId=%d, compId=%d", classname, seq, sysId, componentId)
	}

	static classname = "MAVLinkMessage"

	// Construct a correct message object for the specified blob
	static function fromBlob(b) {
	    local msgId = b[5]
		print("msgId " + msgId + "\n")
		local r = MAVLinkMap[msgId]()
		r.unpack(b)
		return r
	}

    // Do not call directly, subclasses to override
	function packPayload(b) {
    }

    // Do not call directly, subclasses to override
	function unpackPayload(b) {
    }
}

class GPSPositionMessage extends MAVLinkMessage {
	constructor() {
		base.constructor()
	  	this.messageId = MAVLinkMessageID.GPS_RAW_INT
	}

    function unpackPayload(b) {
			lat = b.readn('f')
      		lon = b.readn('f')
    }

    lat = 0
    lon = 0

    // Generates a blob containing the payload
	function packPayload(b) {
     	b.writen(lat,'f')
      	b.writen(lon,'f')
    }

    function tostring() {
	    local b = base.tostring()

		return format("%s lat=%f, lon=%f", b, lat, lon)
	}

	static classname = "GPSPositionMessage"
}

MAVLinkMap <- {}
MAVLinkMap[MAVLinkMessageID.GPS_RAW_INT] <- GPSPositionMessage


print("loaded\n")
local testobj = GPSPositionMessage()
testobj.sysId = 5
testobj.lat = 124.5
print(testobj + "\n")
local b = testobj.toBlob()
print("packed: " + mkString(b, ",") + "\n")
b.seek(0)
local obj2 = MAVLinkMessage.fromBlob(b)
print("unpacked: " + obj2 + "\n")

