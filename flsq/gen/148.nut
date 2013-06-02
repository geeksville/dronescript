
/*
        Set the 8 DOF setpoint for a controller.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SETPOINT_8DOF"
    static crcExtra = 241
    static fieldNames = ["target_system", "val1", "val2", "val3", "val4", "val5", "val6", "val7", "val8"]

    target_system = 0
    val1 = 0
    val2 = 0
    val3 = 0
    val4 = 0
    val5 = 0
    val6 = 0
    val7 = 0
    val8 = 0

    function packPayload(b) {
        writea(b, val1, 'f', 0)
        writea(b, val2, 'f', 0)
        writea(b, val3, 'f', 0)
        writea(b, val4, 'f', 0)
        writea(b, val5, 'f', 0)
        writea(b, val6, 'f', 0)
        writea(b, val7, 'f', 0)
        writea(b, val8, 'f', 0)
        writea(b, target_system, 'b', 0)
    }
    function unpackPayload(b) {
        val1 = reada(b, 'f', 0)
        val2 = reada(b, 'f', 0)
        val3 = reada(b, 'f', 0)
        val4 = reada(b, 'f', 0)
        val5 = reada(b, 'f', 0)
        val6 = reada(b, 'f', 0)
        val7 = reada(b, 'f', 0)
        val8 = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
    }
}

