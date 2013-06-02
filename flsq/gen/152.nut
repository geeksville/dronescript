
/*
        state of APM memory
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MEMINFO"
    static crcExtra = 208
    static fieldNames = ["brkval", "freemem"]

    brkval = 0
    freemem = 0

    function packPayload(b) {
        writea(b, brkval, 'w', 0)
        writea(b, freemem, 'w', 0)
    }
    function unpackPayload(b) {
        brkval = reada(b, 'w', 0)
        freemem = reada(b, 'w', 0)
    }
}

