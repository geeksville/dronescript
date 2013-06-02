
/*
        Set roll, pitch and yaw.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_ROLL_PITCH_YAW_SPEED_THRUST"
    static crcExtra = 24
    static fieldNames = ["target_system", "target_component", "roll_speed", "pitch_speed", "yaw_speed", "thrust"]

    target_system = 0
    target_component = 0
    roll_speed = 0
    pitch_speed = 0
    yaw_speed = 0
    thrust = 0

    function packPayload(b) {
        writea(b, roll_speed, 'f', 0)
        writea(b, pitch_speed, 'f', 0)
        writea(b, yaw_speed, 'f', 0)
        writea(b, thrust, 'f', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        roll_speed = reada(b, 'f', 0)
        pitch_speed = reada(b, 'f', 0)
        yaw_speed = reada(b, 'f', 0)
        thrust = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

