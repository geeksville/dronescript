
/*
        Control on-board Camera Control System to take shots.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "DIGICAM_CONTROL"
    static crcExtra = 22
    static fieldNames = ["target_system", "target_component", "session", "zoom_pos", "zoom_step", "focus_lock", "shot", "command_id", "extra_param", "extra_value"]

    target_system = 0
    target_component = 0
    session = 0
    zoom_pos = 0
    zoom_step = 0
    focus_lock = 0
    shot = 0
    command_id = 0
    extra_param = 0
    extra_value = 0

    function packPayload(b) {
        writea(b, extra_value, 'f', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, session, 'b', 0)
        writea(b, zoom_pos, 'b', 0)
        writea(b, zoom_step, 'c', 0)
        writea(b, focus_lock, 'b', 0)
        writea(b, shot, 'b', 0)
        writea(b, command_id, 'b', 0)
        writea(b, extra_param, 'b', 0)
    }
    function unpackPayload(b) {
        extra_value = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        session = reada(b, 'b', 0)
        zoom_pos = reada(b, 'b', 0)
        zoom_step = reada(b, 'c', 0)
        focus_lock = reada(b, 'b', 0)
        shot = reada(b, 'b', 0)
        command_id = reada(b, 'b', 0)
        extra_param = reada(b, 'b', 0)
    }
}

