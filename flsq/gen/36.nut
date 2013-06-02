
/*
        The RAW values of the servo outputs (for RC input from the
        remote, use the RC_CHANNELS messages). The standard PPM
        modulation is as follows: 1000 microseconds: 0%, 2000
        microseconds: 100%.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SERVO_OUTPUT_RAW"
    static crcExtra = 222
    static fieldNames = ["time_usec", "port", "servo1_raw", "servo2_raw", "servo3_raw", "servo4_raw", "servo5_raw", "servo6_raw", "servo7_raw", "servo8_raw"]

    time_usec = 0
    port = 0
    servo1_raw = 0
    servo2_raw = 0
    servo3_raw = 0
    servo4_raw = 0
    servo5_raw = 0
    servo6_raw = 0
    servo7_raw = 0
    servo8_raw = 0

    function packPayload(b) {
        writea(b, time_usec, 'i', 0)
        writea(b, servo1_raw, 'w', 0)
        writea(b, servo2_raw, 'w', 0)
        writea(b, servo3_raw, 'w', 0)
        writea(b, servo4_raw, 'w', 0)
        writea(b, servo5_raw, 'w', 0)
        writea(b, servo6_raw, 'w', 0)
        writea(b, servo7_raw, 'w', 0)
        writea(b, servo8_raw, 'w', 0)
        writea(b, port, 'b', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'i', 0)
        servo1_raw = reada(b, 'w', 0)
        servo2_raw = reada(b, 'w', 0)
        servo3_raw = reada(b, 'w', 0)
        servo4_raw = reada(b, 'w', 0)
        servo5_raw = reada(b, 'w', 0)
        servo6_raw = reada(b, 'w', 0)
        servo7_raw = reada(b, 'w', 0)
        servo8_raw = reada(b, 'w', 0)
        port = reada(b, 'b', 0)
    }
}

