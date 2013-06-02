
/*
        A certain mission item has been reached. The system will
        either hold this position (or circle on the orbit) or (if the
        autocontinue on the WP was set) continue to the next MISSION.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_ITEM_REACHED"
    static crcExtra = 11
    static fieldNames = ["seq"]

    seq = 0

    function packPayload(b) {
        writea(b, seq, 'w', 0)
    }
    function unpackPayload(b) {
        seq = reada(b, 'w', 0)
    }
}

