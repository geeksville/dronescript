
/*
        The RAW IMU readings for the usual 9DOF sensor setup. This
        message should contain the scaled values to the described
        units
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SCALED_IMU"
    static crcExtra = 170
    static fieldNames = ["time_boot_ms", "xacc", "yacc", "zacc", "xgyro", "ygyro", "zgyro", "xmag", "ymag", "zmag"]

    time_boot_ms = 0
    xacc = 0
    yacc = 0
    zacc = 0
    xgyro = 0
    ygyro = 0
    zgyro = 0
    xmag = 0
    ymag = 0
    zmag = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, xacc, 's', 0)
        writea(b, yacc, 's', 0)
        writea(b, zacc, 's', 0)
        writea(b, xgyro, 's', 0)
        writea(b, ygyro, 's', 0)
        writea(b, zgyro, 's', 0)
        writea(b, xmag, 's', 0)
        writea(b, ymag, 's', 0)
        writea(b, zmag, 's', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        xacc = reada(b, 's', 0)
        yacc = reada(b, 's', 0)
        zacc = reada(b, 's', 0)
        xgyro = reada(b, 's', 0)
        ygyro = reada(b, 's', 0)
        zgyro = reada(b, 's', 0)
        xmag = reada(b, 's', 0)
        ymag = reada(b, 's', 0)
        zmag = reada(b, 's', 0)
    }
}

