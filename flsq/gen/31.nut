
/*
        The attitude in the aeronautical frame (right-handed, Z-down,
        X-front, Y-right), expressed as quaternion.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "ATTITUDE_QUATERNION"
    static crcExtra = 246
    static fieldNames = ["time_boot_ms", "q1", "q2", "q3", "q4", "rollspeed", "pitchspeed", "yawspeed"]

    time_boot_ms = 0
    q1 = 0
    q2 = 0
    q3 = 0
    q4 = 0
    rollspeed = 0
    pitchspeed = 0
    yawspeed = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, q1, 'f', 0)
        writea(b, q2, 'f', 0)
        writea(b, q3, 'f', 0)
        writea(b, q4, 'f', 0)
        writea(b, rollspeed, 'f', 0)
        writea(b, pitchspeed, 'f', 0)
        writea(b, yawspeed, 'f', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        q1 = reada(b, 'f', 0)
        q2 = reada(b, 'f', 0)
        q3 = reada(b, 'f', 0)
        q4 = reada(b, 'f', 0)
        rollspeed = reada(b, 'f', 0)
        pitchspeed = reada(b, 'f', 0)
        yawspeed = reada(b, 'f', 0)
    }
}

