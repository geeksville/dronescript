
/*
        Request a current fence point from MAV
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "FENCE_FETCH_POINT"
    static crcExtra = 68
    static fieldNames = ["target_system", "target_component", "idx"]

    target_system = 0
    target_component = 0
    idx = 0

    function packPayload(b) {
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, idx, 'b', 0)
    }
    function unpackPayload(b) {
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        idx = reada(b, 'b', 0)
    }
}

