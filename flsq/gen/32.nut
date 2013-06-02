
/*
        The filtered local position (e.g. fused computer vision and
        accelerometers). Coordinate frame is right-handed, Z-axis down
        (aeronautical frame, NED / north-east-down convention)
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "LOCAL_POSITION_NED"
    static crcExtra = 185
    static fieldNames = ["time_boot_ms", "x", "y", "z", "vx", "vy", "vz"]

    time_boot_ms = 0
    x = 0
    y = 0
    z = 0
    vx = 0
    vy = 0
    vz = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, x, 'f', 0)
        writea(b, y, 'f', 0)
        writea(b, z, 'f', 0)
        writea(b, vx, 'f', 0)
        writea(b, vy, 'f', 0)
        writea(b, vz, 'f', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        x = reada(b, 'f', 0)
        y = reada(b, 'f', 0)
        z = reada(b, 'f', 0)
        vx = reada(b, 'f', 0)
        vy = reada(b, 'f', 0)
        vz = reada(b, 'f', 0)
    }
}

