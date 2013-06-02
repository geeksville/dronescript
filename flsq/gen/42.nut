
/*
        Message that announces the sequence number of the current
        active mission item. The MAV will fly towards this mission
        item.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_CURRENT"
    static crcExtra = 28
    static fieldNames = ["seq"]

    seq = 0

    function packPayload(b) {
        writea(b, seq, 'w', 0)
    }
    function unpackPayload(b) {
        seq = reada(b, 'w', 0)
    }
}

