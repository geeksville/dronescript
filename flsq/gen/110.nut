
/*
        Begin file transfer
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "FILE_TRANSFER_START"
    static crcExtra = 235
    static fieldNames = ["transfer_uid", "dest_path", "direction", "file_size", "flags"]

    transfer_uid = 0
    dest_path = 0
    direction = 0
    file_size = 0
    flags = 0

    function packPayload(b) {
        writea(b, transfer_uid, 'l', 0)
        writea(b, file_size, 'i', 0)
        writea(b, dest_path, 'c', 240)
        writea(b, direction, 'b', 0)
        writea(b, flags, 'b', 0)
    }
    function unpackPayload(b) {
        transfer_uid = reada(b, 'l', 0)
        file_size = reada(b, 'i', 0)
        dest_path = reada(b, 'c', 240)
        direction = reada(b, 'b', 0)
        flags = reada(b, 'b', 0)
    }
}

