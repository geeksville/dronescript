
/*
        Request a partial list of mission items from the
        system/component.
        http://qgroundcontrol.org/mavlink/waypoint_protocol. If start
        and end index are the same, just send one waypoint.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_REQUEST_PARTIAL_LIST"
    static crcExtra = 212
    static fieldNames = ["target_system", "target_component", "start_index", "end_index"]

    target_system = 0
    target_component = 0
    start_index = 0
    end_index = 0

    function packPayload(b) {
        writea(b, start_index, 's', 0)
        writea(b, end_index, 's', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        start_index = reada(b, 's', 0)
        end_index = reada(b, 's', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

