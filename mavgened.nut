


enum MAVLinkMessageID {
	INVALID,
    GPS_RAW_INT
}

class MAVLink.GPSPositionMessage extends MAVLink.Message {
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

	static classname = "GPSPosition"
}

MAVLink.Map <- {}
MAVLink.Map[MAVLinkMessageID.GPS_RAW_INT] <- MAVLink.GPSPositionMessage

