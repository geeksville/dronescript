


enum MAVMessageID {
	INVALID,
    GPS_RAW_INT
}

class MAV.GPSPositionMessage extends MAV.Message {
	constructor() {
		base.constructor()
	  	this.messageId = MAVMessageID.GPS_RAW_INT
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

MAV.Map[MAVMessageID.GPS_RAW_INT] <- MAV.GPSPositionMessage

