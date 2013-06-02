
/*
        Wind estimation
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "WIND"
    static crcExtra = 1
    static fieldNames = ["direction", "speed", "speed_z"]

    direction = 0
    speed = 0
    speed_z = 0

    function packPayload(b) {
        writea(b, direction, 'f', 0)
        writea(b, speed, 'f', 0)
        writea(b, speed_z, 'f', 0)
    }
    function unpackPayload(b) {
        direction = reada(b, 'f', 0)
        speed = reada(b, 'f', 0)
        speed_z = reada(b, 'f', 0)
    }
}

