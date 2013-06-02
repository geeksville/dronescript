
/*
        Setpoint in roll, pitch, yaw and thrust from the operator
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MANUAL_SETPOINT"
    static crcExtra = 106
    static fieldNames = ["time_boot_ms", "roll", "pitch", "yaw", "thrust", "mode_switch", "manual_override_switch"]

    time_boot_ms = 0
    roll = 0
    pitch = 0
    yaw = 0
    thrust = 0
    mode_switch = 0
    manual_override_switch = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, roll, 'f', 0)
        writea(b, pitch, 'f', 0)
        writea(b, yaw, 'f', 0)
        writea(b, thrust, 'f', 0)
        writea(b, mode_switch, 'b', 0)
        writea(b, manual_override_switch, 'b', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        roll = reada(b, 'f', 0)
        pitch = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
        thrust = reada(b, 'f', 0)
        mode_switch = reada(b, 'b', 0)
        manual_override_switch = reada(b, 'b', 0)
    }
}

