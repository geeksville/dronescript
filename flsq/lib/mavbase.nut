

// Namespace
MAV <- {
}

// some base types from mavlink_types.h
const MAVLINK_TYPE_CHAR     = 0
const MAVLINK_TYPE_UINT8_T  = 1
const MAVLINK_TYPE_INT8_T   = 2
const MAVLINK_TYPE_UINT16_T = 3
const MAVLINK_TYPE_INT16_T  = 4
const MAVLINK_TYPE_UINT32_T = 5
const MAVLINK_TYPE_INT32_T  = 6
const MAVLINK_TYPE_UINT64_T = 7
const MAVLINK_TYPE_INT64_T  = 8
const MAVLINK_TYPE_FLOAT    = 9
const MAVLINK_TYPE_DOUBLE   = 10

class MAV.Message {
    // Subclasses can override
    static fieldNames = []
    static classname = "Message"

    // Private dynamically loaded class definitions
    static dispatcher = {}

    // Instance variables
    seq = 0
    sysId = 0
    componentId = 0
    messageId = 0

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
		local prefix = format("%s: seq=%d, sysId=%d, compId=%d ", classname, seq, sysId, componentId)
		
        return prefix + mkString(map(fieldNames, @(f) f + "=" + rawget(f)), ", ")
    }

    // Create an instance of the specified message type (dynamically loads
    // code as needed)
    static function create(msgId) {
		if(!(msgId in dispatcher))
			dispatcher[msgId] <- dofile("gen/" + msgId + ".nut", true)

		local inst = dispatcher[msgId].instance()
		inst.constructor()
		inst.messageId = msgId
		return inst
    }

    // Construct a correct message object for the specified blob
    static function fromBlob(b) {
		local msgId = b[5]
		print("msgId " + msgId + "\n")
		local r = create(msgId)
		r.unpack(b)
		return r
    }

    // Do not call directly, subclasses to override
    function packPayload(b) {
    }

    // Do not call directly, subclasses to override
    function unpackPayload(b) {
    }

    function writea(b, val, fmt, len) {
		if(len == 0)
			b.writen(val, fmt)
		else
			for(local i=0; i < len; i++) {
			b.writen((i < val.len()) ? val[i] : 0, fmt)
		}
    }

    function reada(b, fmt, len) {
		return b.readn(fmt)
		// FIXME - handle len != 0
    }
}


