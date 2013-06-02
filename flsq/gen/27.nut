
/*
        The RAW IMU readings for the usual 9DOF sensor setup. This
        message should always contain the true raw values without any
        scaling to allow data capture and system debugging.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "RAW_IMU"
    static crcExtra = 144
    static fieldNames = ["time_usec", "xacc", "yacc", "zacc", "xgyro", "ygyro", "zgyro", "xmag", "ymag", "zmag"]

    time_usec = 0
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
        writea(b, time_usec, 'l', 0)
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
        time_usec = reada(b, 'l', 0)
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

