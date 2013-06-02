
/*
        File transfer result
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "FILE_TRANSFER_RES"
    static crcExtra = 124
    static fieldNames = ["transfer_uid", "result"]

    transfer_uid = 0
    result = 0

    function packPayload(b) {
        writea(b, transfer_uid, 'l', 0)
        writea(b, result, 'b', 0)
    }
    function unpackPayload(b) {
        transfer_uid = reada(b, 'l', 0)
        result = reada(b, 'b', 0)
    }
}

