
/*
        The filtered global position (e.g. fused GPS and
        accelerometers). The position is in GPS-frame (right-handed,
        Z-up). It                is designed as scaled integer message
        since the resolution of float is not sufficient.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "GLOBAL_POSITION_INT"
    static crcExtra = 104
    static fieldNames = ["time_boot_ms", "lat", "lon", "alt", "relative_alt", "vx", "vy", "vz", "hdg"]

    time_boot_ms = 0
    lat = 0
    lon = 0
    alt = 0
    relative_alt = 0
    vx = 0
    vy = 0
    vz = 0
    hdg = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, lat, 'i', 0)
        writea(b, lon, 'i', 0)
        writea(b, alt, 'i', 0)
        writea(b, relative_alt, 'i', 0)
        writea(b, vx, 's', 0)
        writea(b, vy, 's', 0)
        writea(b, vz, 's', 0)
        writea(b, hdg, 'w', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        lat = reada(b, 'i', 0)
        lon = reada(b, 'i', 0)
        alt = reada(b, 'i', 0)
        relative_alt = reada(b, 'i', 0)
        vx = reada(b, 's', 0)
        vy = reada(b, 's', 0)
        vz = reada(b, 's', 0)
        hdg = reada(b, 'w', 0)
    }
}

