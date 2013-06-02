
/*

*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "DATA_STREAM"
    static crcExtra = 21
    static fieldNames = ["stream_id", "message_rate", "on_off"]

    stream_id = 0
    message_rate = 0
    on_off = 0

    function packPayload(b) {
        writea(b, message_rate, 'w', 0)
        writea(b, stream_id, 'b', 0)
        writea(b, on_off, 'b', 0)
    }
    function unpackPayload(b) {
        message_rate = reada(b, 'w', 0)
        stream_id = reada(b, 'b', 0)
        on_off = reada(b, 'b', 0)
    }
}

