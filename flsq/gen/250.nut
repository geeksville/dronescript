
/*

*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "DEBUG_VECT"
    static crcExtra = 49
    static fieldNames = ["name", "time_usec", "x", "y", "z"]

    name = 0
    time_usec = 0
    x = 0
    y = 0
    z = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, x, 'f', 0)
        writea(b, y, 'f', 0)
        writea(b, z, 'f', 0)
        writea(b, name, 'c', 10)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        x = reada(b, 'f', 0)
        y = reada(b, 'f', 0)
        z = reada(b, 'f', 0)
        name = reada(b, 'c', 10)
    }
}

