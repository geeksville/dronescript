
/*
        A ping message either requesting or responding to a ping. This
        allows to measure the system latencies, including serial port,
        radio modem and UDP connections.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "PING"
    static crcExtra = 237
    static fieldNames = ["time_usec", "seq", "target_system", "target_component"]

    time_usec = 0
    seq = 0
    target_system = 0
    target_component = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, seq, 'i', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        seq = reada(b, 'i', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

