
/*
        Corrects the systems state by adding an error correction term
        to the position and velocity, and by rotating the attitude by
        a correction angle.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "STATE_CORRECTION"
    static crcExtra = 130
    static fieldNames = ["xErr", "yErr", "zErr", "rollErr", "pitchErr", "yawErr", "vxErr", "vyErr", "vzErr"]

    xErr = 0
    yErr = 0
    zErr = 0
    rollErr = 0
    pitchErr = 0
    yawErr = 0
    vxErr = 0
    vyErr = 0
    vzErr = 0

    function packPayload(b) {
        writea(b, xErr, 'f', 0)
        writea(b, yErr, 'f', 0)
        writea(b, zErr, 'f', 0)
        writea(b, rollErr, 'f', 0)
        writea(b, pitchErr, 'f', 0)
        writea(b, yawErr, 'f', 0)
        writea(b, vxErr, 'f', 0)
        writea(b, vyErr, 'f', 0)
        writea(b, vzErr, 'f', 0)
    }
    function unpackPayload(b) {
        xErr = reada(b, 'f', 0)
        yErr = reada(b, 'f', 0)
        zErr = reada(b, 'f', 0)
        rollErr = reada(b, 'f', 0)
        pitchErr = reada(b, 'f', 0)
        yawErr = reada(b, 'f', 0)
        vxErr = reada(b, 'f', 0)
        vyErr = reada(b, 'f', 0)
        vzErr = reada(b, 'f', 0)
    }
}

