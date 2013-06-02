
/*
        Request to read the onboard parameter with the param_id string
        id. Onboard parameters are stored as key[const char*] ->
        value[float]. This allows to send a parameter to any other
        component (such as the GCS) without the need of previous
        knowledge of possible parameter names. Thus the same GCS can
        store different parameters for different autopilots. See also
        http://qgroundcontrol.org/parameter_interface for a full
        documentation of QGroundControl and IMU code.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "PARAM_REQUEST_READ"
    static crcExtra = 214
    static fieldNames = ["target_system", "target_component", "param_id", "param_index"]

    target_system = 0
    target_component = 0
    param_id = 0
    param_index = 0

    function packPayload(b) {
        writea(b, param_index, 's', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, param_id, 'c', 16)
    }
    function unpackPayload(b) {
        param_index = reada(b, 's', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        param_id = reada(b, 'c', 16)
    }
}

