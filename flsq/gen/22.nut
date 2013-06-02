
/*
        Emit the value of a onboard parameter. The inclusion of
        param_count and param_index in the message allows the
        recipient to keep track of received parameters and allows him
        to re-request missing parameters after a loss or timeout.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "PARAM_VALUE"
    static crcExtra = 220
    static fieldNames = ["param_id", "param_value", "param_type", "param_count", "param_index"]

    param_id = 0
    param_value = 0
    param_type = 0
    param_count = 0
    param_index = 0

    function packPayload(b) {
        writea(b, param_value, 'f', 0)
        writea(b, param_count, 'w', 0)
        writea(b, param_index, 'w', 0)
        writea(b, param_id, 'c', 16)
        writea(b, param_type, 'b', 0)
    }
    function unpackPayload(b) {
        param_value = reada(b, 'f', 0)
        param_count = reada(b, 'w', 0)
        param_index = reada(b, 'w', 0)
        param_id = reada(b, 'c', 16)
        param_type = reada(b, 'b', 0)
    }
}

