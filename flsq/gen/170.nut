
/*
        Data packet, size 32
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "DATA32"
    static crcExtra = 73
    static fieldNames = ["type", "len", "data"]

    type = 0
    len = 0
    data = 0

    function packPayload(b) {
        writea(b, type, 'b', 0)
        writea(b, len, 'b', 0)
        writea(b, data, 'b', 32)
    }
    function unpackPayload(b) {
        type = reada(b, 'b', 0)
        len = reada(b, 'b', 0)
        data = reada(b, 'b', 32)
    }
}

