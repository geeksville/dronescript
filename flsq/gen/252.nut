
/*
        Send a key-value pair as integer. The use of this message is
        discouraged for normal packets, but a quite efficient way for
        testing new messages and getting experimental debug output.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "NAMED_VALUE_INT"
    static crcExtra = 44
    static fieldNames = ["time_boot_ms", "name", "value"]

    time_boot_ms = 0
    name = 0
    value = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, value, 'i', 0)
        writea(b, name, 'c', 10)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        value = reada(b, 'i', 0)
        name = reada(b, 'c', 10)
    }
}

