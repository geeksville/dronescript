
/*
        Set the system mode, as defined by enum MAV_MODE. There is no
        target component id as the mode is by definition for the
        overall aircraft, not only for one component.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_MODE"
    static crcExtra = 89
    static fieldNames = ["target_system", "base_mode", "custom_mode"]

    target_system = 0
    base_mode = 0
    custom_mode = 0

    function packPayload(b) {
        writea(b, custom_mode, 'i', 0)
        writea(b, target_system, 'b', 0)
        writea(b, base_mode, 'b', 0)
    }
    function unpackPayload(b) {
        custom_mode = reada(b, 'i', 0)
        target_system = reada(b, 'b', 0)
        base_mode = reada(b, 'b', 0)
    }
}

