
/*
        Sent from autopilot to simulation. Hardware in the loop
        control outputs
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "HIL_CONTROLS"
    static crcExtra = 63
    static fieldNames = ["time_usec", "roll_ailerons", "pitch_elevator", "yaw_rudder", "throttle", "aux1", "aux2", "aux3", "aux4", "mode", "nav_mode"]

    time_usec = 0
    roll_ailerons = 0
    pitch_elevator = 0
    yaw_rudder = 0
    throttle = 0
    aux1 = 0
    aux2 = 0
    aux3 = 0
    aux4 = 0
    mode = 0
    nav_mode = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, roll_ailerons, 'f', 0)
        writea(b, pitch_elevator, 'f', 0)
        writea(b, yaw_rudder, 'f', 0)
        writea(b, throttle, 'f', 0)
        writea(b, aux1, 'f', 0)
        writea(b, aux2, 'f', 0)
        writea(b, aux3, 'f', 0)
        writea(b, aux4, 'f', 0)
        writea(b, mode, 'b', 0)
        writea(b, nav_mode, 'b', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        roll_ailerons = reada(b, 'f', 0)
        pitch_elevator = reada(b, 'f', 0)
        yaw_rudder = reada(b, 'f', 0)
        throttle = reada(b, 'f', 0)
        aux1 = reada(b, 'f', 0)
        aux2 = reada(b, 'f', 0)
        aux3 = reada(b, 'f', 0)
        aux4 = reada(b, 'f', 0)
        mode = reada(b, 'b', 0)
        nav_mode = reada(b, 'b', 0)
    }
}

