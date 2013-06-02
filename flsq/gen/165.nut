
/*
        Status of key hardware
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "HWSTATUS"
    static crcExtra = 21
    static fieldNames = ["Vcc", "I2Cerr"]

    Vcc = 0
    I2Cerr = 0

    function packPayload(b) {
        writea(b, Vcc, 'w', 0)
        writea(b, I2Cerr, 'b', 0)
    }
    function unpackPayload(b) {
        Vcc = reada(b, 'w', 0)
        I2Cerr = reada(b, 'b', 0)
    }
}

