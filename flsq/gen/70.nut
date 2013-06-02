
/*
        The RAW values of the RC channels sent to the MAV to override
        info received from the RC radio. A value of -1 means no change
        to that channel. A value of 0 means control of that channel
        should be released back to the RC radio. The standard PPM
        modulation is as follows: 1000 microseconds: 0%, 2000
        microseconds: 100%. Individual receivers/transmitters might
        violate this specification.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "RC_CHANNELS_OVERRIDE"
    static crcExtra = 124
    static fieldNames = ["target_system", "target_component", "chan1_raw", "chan2_raw", "chan3_raw", "chan4_raw", "chan5_raw", "chan6_raw", "chan7_raw", "chan8_raw"]

    target_system = 0
    target_component = 0
    chan1_raw = 0
    chan2_raw = 0
    chan3_raw = 0
    chan4_raw = 0
    chan5_raw = 0
    chan6_raw = 0
    chan7_raw = 0
    chan8_raw = 0

    function packPayload(b) {
        writea(b, chan1_raw, 'w', 0)
        writea(b, chan2_raw, 'w', 0)
        writea(b, chan3_raw, 'w', 0)
        writea(b, chan4_raw, 'w', 0)
        writea(b, chan5_raw, 'w', 0)
        writea(b, chan6_raw, 'w', 0)
        writea(b, chan7_raw, 'w', 0)
        writea(b, chan8_raw, 'w', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
    }
    function unpackPayload(b) {
        chan1_raw = reada(b, 'w', 0)
        chan2_raw = reada(b, 'w', 0)
        chan3_raw = reada(b, 'w', 0)
        chan4_raw = reada(b, 'w', 0)
        chan5_raw = reada(b, 'w', 0)
        chan6_raw = reada(b, 'w', 0)
        chan7_raw = reada(b, 'w', 0)
        chan8_raw = reada(b, 'w', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
    }
}

