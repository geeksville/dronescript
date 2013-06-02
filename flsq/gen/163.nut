
/*
        Status of DCM attitude estimator
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "AHRS"
    static crcExtra = 127
    static fieldNames = ["omegaIx", "omegaIy", "omegaIz", "accel_weight", "renorm_val", "error_rp", "error_yaw"]

    omegaIx = 0
    omegaIy = 0
    omegaIz = 0
    accel_weight = 0
    renorm_val = 0
    error_rp = 0
    error_yaw = 0

    function packPayload(b) {
        writea(b, omegaIx, 'f', 0)
        writea(b, omegaIy, 'f', 0)
        writea(b, omegaIz, 'f', 0)
        writea(b, accel_weight, 'f', 0)
        writea(b, renorm_val, 'f', 0)
        writea(b, error_rp, 'f', 0)
        writea(b, error_yaw, 'f', 0)
    }
    function unpackPayload(b) {
        omegaIx = reada(b, 'f', 0)
        omegaIy = reada(b, 'f', 0)
        omegaIz = reada(b, 'f', 0)
        accel_weight = reada(b, 'f', 0)
        renorm_val = reada(b, 'f', 0)
        error_rp = reada(b, 'f', 0)
        error_yaw = reada(b, 'f', 0)
    }
}

