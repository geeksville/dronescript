
/*
        As local waypoints exist, the global MISSION reference allows
        to transform between the local coordinate frame and the global
        (GPS) coordinate frame. This can be necessary when e.g. in-
        and outdoor settings are connected and the MAV should move
        from in- to outdoor.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_GPS_GLOBAL_ORIGIN"
    static crcExtra = 41
    static fieldNames = ["target_system", "latitude", "longitude", "altitude"]

    target_system = 0
    latitude = 0
    longitude = 0
    altitude = 0

    function packPayload(b) {
        writea(b, latitude, 'i', 0)
        writea(b, longitude, 'i', 0)
        writea(b, altitude, 'i', 0)
        writea(b, target_system, 'b', 0)
    }
    function unpackPayload(b) {
        latitude = reada(b, 'i', 0)
        longitude = reada(b, 'i', 0)
        altitude = reada(b, 'i', 0)
        target_system = reada(b, 'b', 0)
    }
}

