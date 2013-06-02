
/*
        Setpoint for up to four quadrotors in a group / wing
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_QUAD_SWARM_ROLL_PITCH_YAW_THRUST"
    static crcExtra = 240
    static fieldNames = ["group", "mode", "roll", "pitch", "yaw", "thrust"]

    group = 0
    mode = 0
    roll = 0
    pitch = 0
    yaw = 0
    thrust = 0

    function packPayload(b) {
        writea(b, roll, 's', 4)
        writea(b, pitch, 's', 4)
        writea(b, yaw, 's', 4)
        writea(b, thrust, 'w', 4)
        writea(b, group, 'b', 0)
        writea(b, mode, 'b', 0)
    }
    function unpackPayload(b) {
        roll = reada(b, 's', 4)
        pitch = reada(b, 's', 4)
        yaw = reada(b, 's', 4)
        thrust = reada(b, 'w', 4)
        group = reada(b, 'b', 0)
        mode = reada(b, 'b', 0)
    }
}

