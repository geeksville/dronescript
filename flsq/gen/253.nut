
/*
        Status text message. These messages are printed in yellow in
        the COMM console of QGroundControl. WARNING: They consume
        quite some bandwidth, so use only for important status and
        error messages. If implemented wisely, these messages are
        buffered on the MCU and sent only at a limited rate (e.g. 10
        Hz).
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "STATUSTEXT"
    static crcExtra = 83
    static fieldNames = ["severity", "text"]

    severity = 0
    text = 0

    function packPayload(b) {
        writea(b, severity, 'b', 0)
        writea(b, text, 'c', 50)
    }
    function unpackPayload(b) {
        severity = reada(b, 'b', 0)
        text = reada(b, 'c', 50)
    }
}

