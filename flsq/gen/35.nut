
/*
        The RAW values of the RC channels received. The standard PPM
        modulation is as follows: 1000 microseconds: 0%, 2000
        microseconds: 100%. Individual receivers/transmitters might
        violate this specification.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "RC_CHANNELS_RAW"
    static crcExtra = 244
    static fieldNames = ["time_boot_ms", "port", "chan1_raw", "chan2_raw", "chan3_raw", "chan4_raw", "chan5_raw", "chan6_raw", "chan7_raw", "chan8_raw", "rssi"]

    time_boot_ms = 0
    port = 0
    chan1_raw = 0
    chan2_raw = 0
    chan3_raw = 0
    chan4_raw = 0
    chan5_raw = 0
    chan6_raw = 0
    chan7_raw = 0
    chan8_raw = 0
    rssi = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, chan1_raw, 'w', 0)
        writea(b, chan2_raw, 'w', 0)
        writea(b, chan3_raw, 'w', 0)
        writea(b, chan4_raw, 'w', 0)
        writea(b, chan5_raw, 'w', 0)
        writea(b, chan6_raw, 'w', 0)
        writea(b, chan7_raw, 'w', 0)
        writea(b, chan8_raw, 'w', 0)
        writea(b, port, 'b', 0)
        writea(b, rssi, 'b', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        chan1_raw = reada(b, 'w', 0)
        chan2_raw = reada(b, 'w', 0)
        chan3_raw = reada(b, 'w', 0)
        chan4_raw = reada(b, 'w', 0)
        chan5_raw = reada(b, 'w', 0)
        chan6_raw = reada(b, 'w', 0)
        chan7_raw = reada(b, 'w', 0)
        chan8_raw = reada(b, 'w', 0)
        port = reada(b, 'b', 0)
        rssi = reada(b, 'b', 0)
    }
}

