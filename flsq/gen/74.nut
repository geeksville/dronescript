
/*
        Metrics typically displayed on a HUD for fixed wing aircraft
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "VFR_HUD"
    static crcExtra = 20
    static fieldNames = ["airspeed", "groundspeed", "heading", "throttle", "alt", "climb"]

    airspeed = 0
    groundspeed = 0
    heading = 0
    throttle = 0
    alt = 0
    climb = 0

    function packPayload(b) {
        writea(b, airspeed, 'f', 0)
        writea(b, groundspeed, 'f', 0)
        writea(b, alt, 'f', 0)
        writea(b, climb, 'f', 0)
        writea(b, heading, 's', 0)
        writea(b, throttle, 'w', 0)
    }
    function unpackPayload(b) {
        airspeed = reada(b, 'f', 0)
        groundspeed = reada(b, 'f', 0)
        alt = reada(b, 'f', 0)
        climb = reada(b, 'f', 0)
        heading = reada(b, 's', 0)
        throttle = reada(b, 'w', 0)
    }
}

