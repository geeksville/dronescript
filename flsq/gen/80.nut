
/*
        Setpoint in roll, pitch, yaw rates and thrust currently active
        on the system.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "ROLL_PITCH_YAW_RATES_THRUST_SETPOINT"
    static crcExtra = 127
    static fieldNames = ["time_boot_ms", "roll_rate", "pitch_rate", "yaw_rate", "thrust"]

    time_boot_ms = 0
    roll_rate = 0
    pitch_rate = 0
    yaw_rate = 0
    thrust = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, roll_rate, 'f', 0)
        writea(b, pitch_rate, 'f', 0)
        writea(b, yaw_rate, 'f', 0)
        writea(b, thrust, 'f', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        roll_rate = reada(b, 'f', 0)
        pitch_rate = reada(b, 'f', 0)
        yaw_rate = reada(b, 'f', 0)
        thrust = reada(b, 'f', 0)
    }
}

