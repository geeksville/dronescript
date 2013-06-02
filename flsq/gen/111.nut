
/*
        Get directory listing
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "FILE_TRANSFER_DIR_LIST"
    static crcExtra = 93
    static fieldNames = ["transfer_uid", "dir_path", "flags"]

    transfer_uid = 0
    dir_path = 0
    flags = 0

    function packPayload(b) {
        writea(b, transfer_uid, 'l', 0)
        writea(b, dir_path, 'c', 240)
        writea(b, flags, 'b', 0)
    }
    function unpackPayload(b) {
        transfer_uid = reada(b, 'l', 0)
        dir_path = reada(b, 'c', 240)
        flags = reada(b, 'b', 0)
    }
}

