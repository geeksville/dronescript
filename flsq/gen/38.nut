
/*
        This message is sent to the MAV to write a partial list. If
        start index == end index, only one item will be transmitted /
        updated. If the start index is NOT 0 and above the current
        list size, this request should be REJECTED!
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_WRITE_PARTIAL_LIST"
    static crcExtra = 9
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

