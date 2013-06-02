
/*
        The attitude in the aeronautical frame (right-handed, Z-down,
        X-front, Y-right).
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "ATTITUDE"
    static crcExtra = 39
    static fieldNames = ["time_boot_ms", "roll", "pitch", "yaw", "rollspeed", "pitchspeed", "yawspeed"]

    time_boot_ms = 0
    roll = 0
    pitch = 0
    yaw = 0
    rollspeed = 0
    pitchspeed = 0
    yawspeed = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, roll, 'f', 0)
        writea(b, pitch, 'f', 0)
        writea(b, yaw, 'f', 0)
        writea(b, rollspeed, 'f', 0)
        writea(b, pitchspeed, 'f', 0)
        writea(b, yawspeed, 'f', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        roll = reada(b, 'f', 0)
        pitch = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
        rollspeed = reada(b, 'f', 0)
        pitchspeed = reada(b, 'f', 0)
        yawspeed = reada(b, 'f', 0)
    }
}

