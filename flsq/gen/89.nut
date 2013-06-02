
/*
        The offset in X, Y, Z and yaw between the LOCAL_POSITION_NED
        messages of MAV X and the global coordinate frame in NED
        coordinates. Coordinate frame is right-handed, Z-axis down
        (aeronautical frame, NED / north-east-down convention)
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "LOCAL_POSITION_NED_SYSTEM_GLOBAL_OFFSET"
    static crcExtra = 231
    static fieldNames = ["time_boot_ms", "x", "y", "z", "roll", "pitch", "yaw"]

    time_boot_ms = 0
    x = 0
    y = 0
    z = 0
    roll = 0
    pitch = 0
    yaw = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, x, 'f', 0)
        writea(b, y, 'f', 0)
        writea(b, z, 'f', 0)
        writea(b, roll, 'f', 0)
        writea(b, pitch, 'f', 0)
        writea(b, yaw, 'f', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        x = reada(b, 'f', 0)
        y = reada(b, 'f', 0)
        z = reada(b, 'f', 0)
        roll = reada(b, 'f', 0)
        pitch = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
    }
}

