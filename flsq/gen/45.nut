
/*
        Delete all mission items at once.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_CLEAR_ALL"
    static crcExtra = 232
    static fieldNames = ["target_system", "target_component"]

    target_system = 0
    target_component = 0

    function packPayload(b) {
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

