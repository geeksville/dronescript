
/*
        Send a debug value. The index is used to discriminate between
        values. These values show up in the plot of QGroundControl as
        DEBUG N.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "DEBUG"
    static crcExtra = 46
    static fieldNames = ["time_boot_ms", "ind", "value"]

    time_boot_ms = 0
    ind = 0
    value = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, value, 'f', 0)
        writea(b, ind, 'b', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        value = reada(b, 'f', 0)
        ind = reada(b, 'b', 0)
    }
}

