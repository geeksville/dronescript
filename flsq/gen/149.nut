
/*
        Set the 6 DOF setpoint for a attitude and position controller.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SETPOINT_6DOF"
    static crcExtra = 15
    static fieldNames = ["target_system", "trans_x", "trans_y", "trans_z", "rot_x", "rot_y", "rot_z"]

    target_system = 0
    trans_x = 0
    trans_y = 0
    trans_z = 0
    rot_x = 0
    rot_y = 0
    rot_z = 0

    function packPayload(b) {
        writea(b, trans_x, 'f', 0)
        writea(b, trans_y, 'f', 0)
        writea(b, trans_z, 'f', 0)
        writea(b, rot_x, 'f', 0)
        writea(b, rot_y, 'f', 0)
        writea(b, rot_z, 'f', 0)
        writea(b, target_system, 'b', 0)
    }
    function unpackPayload(b) {
        trans_x = reada(b, 'f', 0)
        trans_y = reada(b, 'f', 0)
        trans_z = reada(b, 'f', 0)
        rot_x = reada(b, 'f', 0)
        rot_y = reada(b, 'f', 0)
        rot_z = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
    }
}

