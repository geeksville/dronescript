
/*
        Set a safety zone (volume), which is defined by two corners of
        a cube. This message can be used to tell the MAV which
        setpoints/MISSIONs to accept and which to reject. Safety areas
        are often enforced by national or competition regulations.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SAFETY_SET_ALLOWED_AREA"
    static crcExtra = 15
    static fieldNames = ["target_system", "target_component", "frame", "p1x", "p1y", "p1z", "p2x", "p2y", "p2z"]

    target_system = 0
    target_component = 0
    frame = 0
    p1x = 0
    p1y = 0
    p1z = 0
    p2x = 0
    p2y = 0
    p2z = 0

    function packPayload(b) {
        writea(b, p1x, 'f', 0)
        writea(b, p1y, 'f', 0)
        writea(b, p1z, 'f', 0)
        writea(b, p2x, 'f', 0)
        writea(b, p2y, 'f', 0)
        writea(b, p2z, 'f', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, frame, 'b', 0)
    }
    function unpackPayload(b) {
        p1x = reada(b, 'f', 0)
        p1y = reada(b, 'f', 0)
        p1z = reada(b, 'f', 0)
        p2x = reada(b, 'f', 0)
        p2y = reada(b, 'f', 0)
        p2z = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        frame = reada(b, 'b', 0)
    }
}

