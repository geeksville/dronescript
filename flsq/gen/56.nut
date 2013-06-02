
/*
        Set roll, pitch and yaw.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_ROLL_PITCH_YAW_THRUST"
    static crcExtra = 100
    static fieldNames = ["target_system", "target_component", "roll", "pitch", "yaw", "thrust"]

    target_system = 0
    target_component = 0
    roll = 0
    pitch = 0
    yaw = 0
    thrust = 0

    function packPayload(b) {
        writea(b, roll, 'f', 0)
        writea(b, pitch, 'f', 0)
        writea(b, yaw, 'f', 0)
        writea(b, thrust, 'f', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        roll = reada(b, 'f', 0)
        pitch = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
        thrust = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

