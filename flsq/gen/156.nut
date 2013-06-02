
/*
        Message to configure a camera mount, directional antenna, etc.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MOUNT_CONFIGURE"
    static crcExtra = 19
    static fieldNames = ["target_system", "target_component", "mount_mode", "stab_roll", "stab_pitch", "stab_yaw"]

    target_system = 0
    target_component = 0
    mount_mode = 0
    stab_roll = 0
    stab_pitch = 0
    stab_yaw = 0

    function packPayload(b) {
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, mount_mode, 'b', 0)
        writea(b, stab_roll, 'b', 0)
        writea(b, stab_pitch, 'b', 0)
        writea(b, stab_yaw, 'b', 0)
    }
    function unpackPayload(b) {
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        mount_mode = reada(b, 'b', 0)
        stab_roll = reada(b, 'b', 0)
        stab_pitch = reada(b, 'b', 0)
        stab_yaw = reada(b, 'b', 0)
    }
}

