
/*
        Send raw controller memory. The use of this message is
        discouraged for normal packets, but a quite efficient way for
        testing new messages and getting experimental debug output.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MEMORY_VECT"
    static crcExtra = 204
    static fieldNames = ["address", "ver", "type", "value"]

    address = 0
    ver = 0
    type = 0
    value = 0

    function packPayload(b) {
        writea(b, address, 'w', 0)
        writea(b, ver, 'b', 0)
        writea(b, type, 'b', 0)
        writea(b, value, 'c', 32)
    }
    function unpackPayload(b) {
        address = reada(b, 'w', 0)
        ver = reada(b, 'b', 0)
        type = reada(b, 'b', 0)
        value = reada(b, 'c', 32)
    }
}

