
/*
        Ack message during MISSION handling. The type field states if
        this message is a positive ack (type=0) or if an error
        happened (type=non-zero).
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_ACK"
    static crcExtra = 153
    static fieldNames = ["target_system", "target_component", "type"]

    target_system = 0
    target_component = 0
    type = 0

    function packPayload(b) {
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, type, 'b', 0)
    }
    function unpackPayload(b) {
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        type = reada(b, 'b', 0)
    }
}

