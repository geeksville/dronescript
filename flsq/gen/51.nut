
/*
        Transmit the current local setpoint of the controller to other
        MAVs (collision avoidance) and to the GCS.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "LOCAL_POSITION_SETPOINT"
    static crcExtra = 223
    static fieldNames = ["coordinate_frame", "x", "y", "z", "yaw"]

    coordinate_frame = 0
    x = 0
    y = 0
    z = 0
    yaw = 0

    function packPayload(b) {
        writea(b, x, 'f', 0)
        writea(b, y, 'f', 0)
        writea(b, z, 'f', 0)
        writea(b, yaw, 'f', 0)
        writea(b, coordinate_frame, 'b', 0)
    }
    function unpackPayload(b) {
        x = reada(b, 'f', 0)
        y = reada(b, 'f', 0)
        z = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
        coordinate_frame = reada(b, 'b', 0)
    }
}

