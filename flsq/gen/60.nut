
/*
        Setpoint in the four motor speeds
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_QUAD_MOTORS_SETPOINT"
    static crcExtra = 30
    static fieldNames = ["target_system", "motor_front_nw", "motor_right_ne", "motor_back_se", "motor_left_sw"]

    target_system = 0
    motor_front_nw = 0
    motor_right_ne = 0
    motor_back_se = 0
    motor_left_sw = 0

    function packPayload(b) {
        writea(b, motor_front_nw, 'w', 0)
        writea(b, motor_right_ne, 'w', 0)
        writea(b, motor_back_se, 'w', 0)
        writea(b, motor_left_sw, 'w', 0)
        writea(b, target_system, 'b', 0)
    }
    function unpackPayload(b) {
        motor_front_nw = reada(b, 'w', 0)
        motor_right_ne = reada(b, 'w', 0)
        motor_back_se = reada(b, 'w', 0)
        motor_left_sw = reada(b, 'w', 0)
        target_system = reada(b, 'b', 0)
    }
}

