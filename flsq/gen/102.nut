
/*

*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "VISION_POSITION_ESTIMATE"
    static crcExtra = 158
    static fieldNames = ["usec", "x", "y", "z", "roll", "pitch", "yaw"]

    usec = 0
    x = 0
    y = 0
    z = 0
    roll = 0
    pitch = 0
    yaw = 0

    function packPayload(b) {
        writea(b, usec, 'l', 0)
        writea(b, x, 'f', 0)
        writea(b, y, 'f', 0)
        writea(b, z, 'f', 0)
        writea(b, roll, 'f', 0)
        writea(b, pitch, 'f', 0)
        writea(b, yaw, 'f', 0)
    }
    function unpackPayload(b) {
        usec = reada(b, 'l', 0)
        x = reada(b, 'f', 0)
        y = reada(b, 'f', 0)
        z = reada(b, 'f', 0)
        roll = reada(b, 'f', 0)
        pitch = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
    }
}

