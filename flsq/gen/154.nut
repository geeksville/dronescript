
/*
        Configure on-board Camera Control System.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "DIGICAM_CONFIGURE"
    static crcExtra = 84
    static fieldNames = ["target_system", "target_component", "mode", "shutter_speed", "aperture", "iso", "exposure_type", "command_id", "engine_cut_off", "extra_param", "extra_value"]

    target_system = 0
    target_component = 0
    mode = 0
    shutter_speed = 0
    aperture = 0
    iso = 0
    exposure_type = 0
    command_id = 0
    engine_cut_off = 0
    extra_param = 0
    extra_value = 0

    function packPayload(b) {
        writea(b, extra_value, 'f', 0)
        writea(b, shutter_speed, 'w', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, mode, 'b', 0)
        writea(b, aperture, 'b', 0)
        writea(b, iso, 'b', 0)
        writea(b, exposure_type, 'b', 0)
        writea(b, command_id, 'b', 0)
        writea(b, engine_cut_off, 'b', 0)
        writea(b, extra_param, 'b', 0)
    }
    function unpackPayload(b) {
        extra_value = reada(b, 'f', 0)
        shutter_speed = reada(b, 'w', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        mode = reada(b, 'b', 0)
        aperture = reada(b, 'b', 0)
        iso = reada(b, 'b', 0)
        exposure_type = reada(b, 'b', 0)
        command_id = reada(b, 'b', 0)
        engine_cut_off = reada(b, 'b', 0)
        extra_param = reada(b, 'b', 0)
    }
}

