
/*
        Setpoint in roll, pitch, yaw currently active on the system.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "ROLL_PITCH_YAW_THRUST_SETPOINT"
    static crcExtra = 239
    static fieldNames = ["time_boot_ms", "roll", "pitch", "yaw", "thrust"]

    time_boot_ms = 0
    roll = 0
    pitch = 0
    yaw = 0
    thrust = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, roll, 'f', 0)
        writea(b, pitch, 'f', 0)
        writea(b, yaw, 'f', 0)
        writea(b, thrust, 'f', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        roll = reada(b, 'f', 0)
        pitch = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
        thrust = reada(b, 'f', 0)
    }
}

