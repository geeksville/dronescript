
/*
        Set the current global position setpoint.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_GLOBAL_POSITION_SETPOINT_INT"
    static crcExtra = 33
    static fieldNames = ["coordinate_frame", "latitude", "longitude", "altitude", "yaw"]

    coordinate_frame = 0
    latitude = 0
    longitude = 0
    altitude = 0
    yaw = 0

    function packPayload(b) {
        writea(b, latitude, 'i', 0)
        writea(b, longitude, 'i', 0)
        writea(b, altitude, 'i', 0)
        writea(b, yaw, 's', 0)
        writea(b, coordinate_frame, 'b', 0)
    }
    function unpackPayload(b) {
        latitude = reada(b, 'i', 0)
        longitude = reada(b, 'i', 0)
        altitude = reada(b, 'i', 0)
        yaw = reada(b, 's', 0)
        coordinate_frame = reada(b, 'b', 0)
    }
}

