
/*
        Emit an encrypted signature / key identifying this system.
        PLEASE NOTE: This protocol has been kept simple, so
        transmitting the key requires an encrypted channel for true
        safety.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "AUTH_KEY"
    static crcExtra = 119
    static fieldNames = ["key"]

    key = 0

    function packPayload(b) {
        writea(b, key, 'c', 32)
    }
    function unpackPayload(b) {
        key = reada(b, 'c', 32)
    }
}

