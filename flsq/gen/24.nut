
/*
        The global position, as returned by the Global Positioning
        System (GPS). This is                 NOT the global position
        estimate of the sytem, but rather a RAW sensor value. See
        message GLOBAL_POSITION for the global position estimate.
        Coordinate frame is right-handed, Z-axis up (GPS frame).
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "GPS_RAW_INT"
    static crcExtra = 24
    static fieldNames = ["time_usec", "fix_type", "lat", "lon", "alt", "eph", "epv", "vel", "cog", "satellites_visible"]

    time_usec = 0
    fix_type = 0
    lat = 0
    lon = 0
    alt = 0
    eph = 0
    epv = 0
    vel = 0
    cog = 0
    satellites_visible = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, lat, 'i', 0)
        writea(b, lon, 'i', 0)
        writea(b, alt, 'i', 0)
        writea(b, eph, 'w', 0)
        writea(b, epv, 'w', 0)
        writea(b, vel, 'w', 0)
        writea(b, cog, 'w', 0)
        writea(b, fix_type, 'b', 0)
        writea(b, satellites_visible, 'b', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        lat = reada(b, 'i', 0)
        lon = reada(b, 'i', 0)
        alt = reada(b, 'i', 0)
        eph = reada(b, 'w', 0)
        epv = reada(b, 'w', 0)
        vel = reada(b, 'w', 0)
        cog = reada(b, 'w', 0)
        fix_type = reada(b, 'b', 0)
        satellites_visible = reada(b, 'b', 0)
    }
}

