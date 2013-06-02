
/*
        Status of geo-fencing. Sent in extended             status
        stream when fencing enabled
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "FENCE_STATUS"
    static crcExtra = 189
    static fieldNames = ["breach_status", "breach_count", "breach_type", "breach_time"]

    breach_status = 0
    breach_count = 0
    breach_type = 0
    breach_time = 0

    function packPayload(b) {
        writea(b, breach_time, 'i', 0)
        writea(b, breach_count, 'w', 0)
        writea(b, breach_status, 'b', 0)
        writea(b, breach_type, 'b', 0)
    }
    function unpackPayload(b) {
        breach_time = reada(b, 'i', 0)
        breach_count = reada(b, 'w', 0)
        breach_status = reada(b, 'b', 0)
        breach_type = reada(b, 'b', 0)
    }
}

