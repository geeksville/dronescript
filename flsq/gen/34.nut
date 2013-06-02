
/*
        The scaled values of the RC channels received. (-100%) -10000,
        (0%) 0, (100%) 10000. Channels that are inactive should be set
        to 65535.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "RC_CHANNELS_SCALED"
    static crcExtra = 237
    static fieldNames = ["time_boot_ms", "port", "chan1_scaled", "chan2_scaled", "chan3_scaled", "chan4_scaled", "chan5_scaled", "chan6_scaled", "chan7_scaled", "chan8_scaled", "rssi"]

    time_boot_ms = 0
    port = 0
    chan1_scaled = 0
    chan2_scaled = 0
    chan3_scaled = 0
    chan4_scaled = 0
    chan5_scaled = 0
    chan6_scaled = 0
    chan7_scaled = 0
    chan8_scaled = 0
    rssi = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, chan1_scaled, 's', 0)
        writea(b, chan2_scaled, 's', 0)
        writea(b, chan3_scaled, 's', 0)
        writea(b, chan4_scaled, 's', 0)
        writea(b, chan5_scaled, 's', 0)
        writea(b, chan6_scaled, 's', 0)
        writea(b, chan7_scaled, 's', 0)
        writea(b, chan8_scaled, 's', 0)
        writea(b, port, 'b', 0)
        writea(b, rssi, 'b', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        chan1_scaled = reada(b, 's', 0)
        chan2_scaled = reada(b, 's', 0)
        chan3_scaled = reada(b, 's', 0)
        chan4_scaled = reada(b, 's', 0)
        chan5_scaled = reada(b, 's', 0)
        chan6_scaled = reada(b, 's', 0)
        chan7_scaled = reada(b, 's', 0)
        chan8_scaled = reada(b, 's', 0)
        port = reada(b, 'b', 0)
        rssi = reada(b, 'b', 0)
    }
}

