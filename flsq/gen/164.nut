
/*
        Status of simulation environment, if used
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SIMSTATE"
    static crcExtra = 111
    static fieldNames = ["roll", "pitch", "yaw", "xacc", "yacc", "zacc", "xgyro", "ygyro", "zgyro", "lat", "lng"]

    roll = 0
    pitch = 0
    yaw = 0
    xacc = 0
    yacc = 0
    zacc = 0
    xgyro = 0
    ygyro = 0
    zgyro = 0
    lat = 0
    lng = 0

    function packPayload(b) {
        writea(b, roll, 'f', 0)
        writea(b, pitch, 'f', 0)
        writea(b, yaw, 'f', 0)
        writea(b, xacc, 'f', 0)
        writea(b, yacc, 'f', 0)
        writea(b, zacc, 'f', 0)
        writea(b, xgyro, 'f', 0)
        writea(b, ygyro, 'f', 0)
        writea(b, zgyro, 'f', 0)
        writea(b, lat, 'f', 0)
        writea(b, lng, 'f', 0)
    }
    function unpackPayload(b) {
        roll = reada(b, 'f', 0)
        pitch = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
        xacc = reada(b, 'f', 0)
        yacc = reada(b, 'f', 0)
        zacc = reada(b, 'f', 0)
        xgyro = reada(b, 'f', 0)
        ygyro = reada(b, 'f', 0)
        zgyro = reada(b, 'f', 0)
        lat = reada(b, 'f', 0)
        lng = reada(b, 'f', 0)
    }
}

