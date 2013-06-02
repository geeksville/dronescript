
/*

*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "VISION_SPEED_ESTIMATE"
    static crcExtra = 208
    static fieldNames = ["usec", "x", "y", "z"]

    usec = 0
    x = 0
    y = 0
    z = 0

    function packPayload(b) {
        writea(b, usec, 'l', 0)
        writea(b, x, 'f', 0)
        writea(b, y, 'f', 0)
        writea(b, z, 'f', 0)
    }
    function unpackPayload(b) {
        usec = reada(b, 'l', 0)
        x = reada(b, 'f', 0)
        y = reada(b, 'f', 0)
        z = reada(b, 'f', 0)
    }
}

