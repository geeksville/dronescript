
/*
        Set a parameter value TEMPORARILY to RAM. It will be reset to
        default on system reboot. Send the ACTION
        MAV_ACTION_STORAGE_WRITE to PERMANENTLY write the RAM contents
        to EEPROM. IMPORTANT: The receiving component should
        acknowledge the new parameter value by sending a param_value
        message to all communication partners. This will also ensure
        that multiple GCS all have an up-to-date list of all
        parameters. If the sending GCS did not receive a PARAM_VALUE
        message within its timeout time, it should re-send the
        PARAM_SET message.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "PARAM_SET"
    static crcExtra = 168
    static fieldNames = ["target_system", "target_component", "param_id", "param_value", "param_type"]

    target_system = 0
    target_component = 0
    param_id = 0
    param_value = 0
    param_type = 0

    function packPayload(b) {
        writea(b, param_value, 'f', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, param_id, 'c', 16)
        writea(b, param_type, 'b', 0)
    }
    function unpackPayload(b) {
        param_value = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        param_id = reada(b, 'c', 16)
        param_type = reada(b, 'b', 0)
    }
}

