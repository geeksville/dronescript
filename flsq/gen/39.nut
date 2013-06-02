
/*
        Message encoding a mission item. This message is emitted to
        announce                 the presence of a mission item and to
        set a mission item on the system. The mission item can be
        either in x, y, z meters (type: LOCAL) or x:lat, y:lon,
        z:altitude. Local frame is Z-down, right handed (NED), global
        frame is Z-up, right handed (ENU). See also
        http://qgroundcontrol.org/mavlink/waypoint_protocol.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MISSION_ITEM"
    static crcExtra = 254
    static fieldNames = ["target_system", "target_component", "seq", "frame", "command", "current", "autocontinue", "param1", "param2", "param3", "param4", "x", "y", "z"]

    target_system = 0
    target_component = 0
    seq = 0
    frame = 0
    command = 0
    current = 0
    autocontinue = 0
    param1 = 0
    param2 = 0
    param3 = 0
    param4 = 0
    x = 0
    y = 0
    z = 0

    function packPayload(b) {
        writea(b, param1, 'f', 0)
        writea(b, param2, 'f', 0)
        writea(b, param3, 'f', 0)
        writea(b, param4, 'f', 0)
        writea(b, x, 'f', 0)
        writea(b, y, 'f', 0)
        writea(b, z, 'f', 0)
        writea(b, seq, 'w', 0)
        writea(b, command, 'w', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, frame, 'b', 0)
        writea(b, current, 'b', 0)
        writea(b, autocontinue, 'b', 0)
    }
    function unpackPayload(b) {
        param1 = reada(b, 'f', 0)
        param2 = reada(b, 'f', 0)
        param3 = reada(b, 'f', 0)
        param4 = reada(b, 'f', 0)
        x = reada(b, 'f', 0)
        y = reada(b, 'f', 0)
        z = reada(b, 'f', 0)
        seq = reada(b, 'w', 0)
        command = reada(b, 'w', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        frame = reada(b, 'b', 0)
        current = reada(b, 'b', 0)
        autocontinue = reada(b, 'b', 0)
    }
}

