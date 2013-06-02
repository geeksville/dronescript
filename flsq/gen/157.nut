
/*
        Message to control a camera mount, directional antenna, etc.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MOUNT_CONTROL"
    static crcExtra = 21
    static fieldNames = ["target_system", "target_component", "input_a", "input_b", "input_c", "save_position"]

    target_system = 0
    target_component = 0
    input_a = 0
    input_b = 0
    input_c = 0
    save_position = 0

    function packPayload(b) {
        writea(b, input_a, 'i', 0)
        writea(b, input_b, 'i', 0)
        writea(b, input_c, 'i', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, save_position, 'b', 0)
    }
    function unpackPayload(b) {
        input_a = reada(b, 'i', 0)
        input_b = reada(b, 'i', 0)
        input_c = reada(b, 'i', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        save_position = reada(b, 'b', 0)
    }
}

