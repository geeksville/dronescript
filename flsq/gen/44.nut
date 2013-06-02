
/*
        This message is emitted as response to MISSION_REQUEST_LIST by
        the MAV and to initiate a write transaction. The GCS can then
        request the individual mission item based on the knowledge of
        the total number of MISSIONs.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_COUNT"
    static crcExtra = 221
    static fieldNames = ["target_system", "target_component", "count"]

    target_system = 0
    target_component = 0
    count = 0

    function packPayload(b) {
        writea(b, count, 'w', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        count = reada(b, 'w', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

