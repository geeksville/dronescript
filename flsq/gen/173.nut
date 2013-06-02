
/*
        Rangefinder reporting
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "RANGEFINDER"
    static crcExtra = 83
    static fieldNames = ["distance", "voltage"]

    distance = 0
    voltage = 0

    function packPayload(b) {
        writea(b, distance, 'f', 0)
        writea(b, voltage, 'f', 0)
    }
    function unpackPayload(b) {
        distance = reada(b, 'f', 0)
        voltage = reada(b, 'f', 0)
    }
}

