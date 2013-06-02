
/*
        The IMU readings in SI units in NED body frame
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "HIGHRES_IMU"
    static crcExtra = 93
    static fieldNames = ["time_usec", "xacc", "yacc", "zacc", "xgyro", "ygyro", "zgyro", "xmag", "ymag", "zmag", "abs_pressure", "diff_pressure", "pressure_alt", "temperature", "fields_updated"]

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
    abs_pressure = 0
    diff_pressure = 0
    pressure_alt = 0
    temperature = 0
    fields_updated = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, xacc, 'f', 0)
        writea(b, yacc, 'f', 0)
        writea(b, zacc, 'f', 0)
        writea(b, xgyro, 'f', 0)
        writea(b, ygyro, 'f', 0)
        writea(b, zgyro, 'f', 0)
        writea(b, xmag, 'f', 0)
        writea(b, ymag, 'f', 0)
        writea(b, zmag, 'f', 0)
        writea(b, abs_pressure, 'f', 0)
        writea(b, diff_pressure, 'f', 0)
        writea(b, pressure_alt, 'f', 0)
        writea(b, temperature, 'f', 0)
        writea(b, fields_updated, 'w', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        xacc = reada(b, 'f', 0)
        yacc = reada(b, 'f', 0)
        zacc = reada(b, 'f', 0)
        xgyro = reada(b, 'f', 0)
        ygyro = reada(b, 'f', 0)
        zgyro = reada(b, 'f', 0)
        xmag = reada(b, 'f', 0)
        ymag = reada(b, 'f', 0)
        zmag = reada(b, 'f', 0)
        abs_pressure = reada(b, 'f', 0)
        diff_pressure = reada(b, 'f', 0)
        pressure_alt = reada(b, 'f', 0)
        temperature = reada(b, 'f', 0)
        fields_updated = reada(b, 'w', 0)
    }
}

