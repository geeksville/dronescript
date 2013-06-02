
/*
        set the magnetometer offsets
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_MAG_OFFSETS"
    static crcExtra = 219
    static fieldNames = ["target_system", "target_component", "mag_ofs_x", "mag_ofs_y", "mag_ofs_z"]

    target_system = 0
    target_component = 0
    mag_ofs_x = 0
    mag_ofs_y = 0
    mag_ofs_z = 0

    function packPayload(b) {
        writea(b, mag_ofs_x, 's', 0)
        writea(b, mag_ofs_y, 's', 0)
        writea(b, mag_ofs_z, 's', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        mag_ofs_x = reada(b, 's', 0)
        mag_ofs_y = reada(b, 's', 0)
        mag_ofs_z = reada(b, 's', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

