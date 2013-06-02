
/*
        Request the information of the mission item with the sequence
        number seq. The response of the system to this message should
        be a MISSION_ITEM message.
        http://qgroundcontrol.org/mavlink/waypoint_protocol
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_REQUEST"
    static crcExtra = 230
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

