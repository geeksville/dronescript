
/*
        Accept / deny control of this MAV
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "CHANGE_OPERATOR_CONTROL_ACK"
    static crcExtra = 104
    static fieldNames = ["gcs_system_id", "control_request", "ack"]

    gcs_system_id = 0
    control_request = 0
    ack = 0

    function packPayload(b) {
        writea(b, gcs_system_id, 'b', 0)
        writea(b, control_request, 'b', 0)
        writea(b, ack, 'b', 0)
    }
    function unpackPayload(b) {
        gcs_system_id = reada(b, 'b', 0)
        control_request = reada(b, 'b', 0)
        ack = reada(b, 'b', 0)
    }
}

