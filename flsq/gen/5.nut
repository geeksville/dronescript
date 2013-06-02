
/*
        Request to control this MAV
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "CHANGE_OPERATOR_CONTROL"
    static crcExtra = 217
    static fieldNames = ["target_system", "control_request", "version", "passkey"]

    target_system = 0
    control_request = 0
    version = 0
    passkey = 0

    function packPayload(b) {
        writea(b, target_system, 'b', 0)
        writea(b, control_request, 'b', 0)
        writea(b, version, 'b', 0)
        writea(b, passkey, 'c', 25)
    }
    function unpackPayload(b) {
        target_system = reada(b, 'b', 0)
        control_request = reada(b, 'b', 0)
        version = reada(b, 'b', 0)
        passkey = reada(b, 'c', 25)
    }
}

