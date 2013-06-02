
/*
        The heartbeat message shows that a system is present and
        responding. The type of the MAV and Autopilot hardware allow
        the receiving system to treat further messages from this
        system appropriate (e.g. by laying out the user interface
        based on the autopilot).
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "HEARTBEAT"
    static crcExtra = 50
    static fieldNames = ["type", "autopilot", "base_mode", "custom_mode", "system_status", "mavlink_version"]

    type = 0
    autopilot = 0
    base_mode = 0
    custom_mode = 0
    system_status = 0
    mavlink_version = 0

    function packPayload(b) {
        writea(b, custom_mode, 'i', 0)
        writea(b, type, 'b', 0)
        writea(b, autopilot, 'b', 0)
        writea(b, base_mode, 'b', 0)
        writea(b, system_status, 'b', 0)
        writea(b, mavlink_version, 'b', 0)
    }
    function unpackPayload(b) {
        custom_mode = reada(b, 'i', 0)
        type = reada(b, 'b', 0)
        autopilot = reada(b, 'b', 0)
        base_mode = reada(b, 'b', 0)
        system_status = reada(b, 'b', 0)
        mavlink_version = reada(b, 'b', 0)
    }
}

