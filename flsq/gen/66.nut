
/*

*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "REQUEST_DATA_STREAM"
    static crcExtra = 148
    static fieldNames = ["target_system", "target_component", "req_stream_id", "req_message_rate", "start_stop"]

    target_system = 0
    target_component = 0
    req_stream_id = 0
    req_message_rate = 0
    start_stop = 0

    function packPayload(b) {
        writea(b, req_message_rate, 'w', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, req_stream_id, 'b', 0)
        writea(b, start_stop, 'b', 0)
    }
    function unpackPayload(b) {
        req_message_rate = reada(b, 'w', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        req_stream_id = reada(b, 'b', 0)
        start_stop = reada(b, 'b', 0)
    }
}

