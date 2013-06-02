
/*
        Message with some status from APM to GCS about camera or
        antenna mount
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MOUNT_STATUS"
    static crcExtra = 134
    static fieldNames = ["target_system", "target_component", "pointing_a", "pointing_b", "pointing_c"]

    target_system = 0
    target_component = 0
    pointing_a = 0
    pointing_b = 0
    pointing_c = 0

    function packPayload(b) {
        writea(b, pointing_a, 'i', 0)
        writea(b, pointing_b, 'i', 0)
        writea(b, pointing_c, 'i', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        pointing_a = reada(b, 'i', 0)
        pointing_b = reada(b, 'i', 0)
        pointing_c = reada(b, 'i', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

