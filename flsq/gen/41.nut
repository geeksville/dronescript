
/*
        Set the mission item with sequence number seq as current item.
        This means that the MAV will continue to this mission item on
        the shortest path (not following the mission items in-
        between).
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_SET_CURRENT"
    static crcExtra = 28
    static fieldNames = ["target_system", "target_component", "seq"]

    target_system = 0
    target_component = 0
    seq = 0

    function packPayload(b) {
        writea(b, seq, 'w', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        seq = reada(b, 'w', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

