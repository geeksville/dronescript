
/*
        Once the MAV sets a new GPS-Local correspondence, this message
        announces the origin (0,0,0) position
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "GPS_GLOBAL_ORIGIN"
    static crcExtra = 39
    static fieldNames = ["latitude", "longitude", "altitude"]

    latitude = 0
    longitude = 0
    altitude = 0

    function packPayload(b) {
        writea(b, latitude, 'i', 0)
        writea(b, longitude, 'i', 0)
        writea(b, altitude, 'i', 0)
    }
    function unpackPayload(b) {
        latitude = reada(b, 'i', 0)
        longitude = reada(b, 'i', 0)
        altitude = reada(b, 'i', 0)
    }
}

