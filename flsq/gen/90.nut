
/*
        Sent from simulation to autopilot. This packet is useful for
        high throughput applications such as hardware in the loop
        simulations.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "HIL_STATE"
    static crcExtra = 183
    static fieldNames = ["time_usec", "roll", "pitch", "yaw", "rollspeed", "pitchspeed", "yawspeed", "lat", "lon", "alt", "vx", "vy", "vz", "xacc", "yacc", "zacc"]

    time_usec = 0
    roll = 0
    pitch = 0
    yaw = 0
    rollspeed = 0
    pitchspeed = 0
    yawspeed = 0
    lat = 0
    lon = 0
    alt = 0
    vx = 0
    vy = 0
    vz = 0
    xacc = 0
    yacc = 0
    zacc = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, roll, 'f', 0)
        writea(b, pitch, 'f', 0)
        writea(b, yaw, 'f', 0)
        writea(b, rollspeed, 'f', 0)
        writea(b, pitchspeed, 'f', 0)
        writea(b, yawspeed, 'f', 0)
        writea(b, lat, 'i', 0)
        writea(b, lon, 'i', 0)
        writea(b, alt, 'i', 0)
        writea(b, vx, 's', 0)
        writea(b, vy, 's', 0)
        writea(b, vz, 's', 0)
        writea(b, xacc, 's', 0)
        writea(b, yacc, 's', 0)
        writea(b, zacc, 's', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        roll = reada(b, 'f', 0)
        pitch = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
        rollspeed = reada(b, 'f', 0)
        pitchspeed = reada(b, 'f', 0)
        yawspeed = reada(b, 'f', 0)
        lat = reada(b, 'i', 0)
        lon = reada(b, 'i', 0)
        alt = reada(b, 'i', 0)
        vx = reada(b, 's', 0)
        vy = reada(b, 's', 0)
        vz = reada(b, 's', 0)
        xacc = reada(b, 's', 0)
        yacc = reada(b, 's', 0)
        zacc = reada(b, 's', 0)
    }
}

