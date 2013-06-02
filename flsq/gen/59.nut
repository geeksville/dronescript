
/*
        Setpoint in rollspeed, pitchspeed, yawspeed currently active
        on the system.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "ROLL_PITCH_YAW_SPEED_THRUST_SETPOINT"
    static crcExtra = 238
    static fieldNames = ["time_boot_ms", "roll_speed", "pitch_speed", "yaw_speed", "thrust"]

    time_boot_ms = 0
    roll_speed = 0
    pitch_speed = 0
    yaw_speed = 0
    thrust = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, roll_speed, 'f', 0)
        writea(b, pitch_speed, 'f', 0)
        writea(b, yaw_speed, 'f', 0)
        writea(b, thrust, 'f', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        roll_speed = reada(b, 'f', 0)
        pitch_speed = reada(b, 'f', 0)
        yaw_speed = reada(b, 'f', 0)
        thrust = reada(b, 'f', 0)
    }
}

