
/*
        The RAW pressure readings for the typical setup of one
        absolute pressure and one differential pressure sensor. The
        sensor values should be the raw, UNSCALED ADC values.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "RAW_PRESSURE"
    static crcExtra = 67
    static fieldNames = ["time_usec", "press_abs", "press_diff1", "press_diff2", "temperature"]

    time_usec = 0
    press_abs = 0
    press_diff1 = 0
    press_diff2 = 0
    temperature = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, press_abs, 's', 0)
        writea(b, press_diff1, 's', 0)
        writea(b, press_diff2, 's', 0)
        writea(b, temperature, 's', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        press_abs = reada(b, 's', 0)
        press_diff1 = reada(b, 's', 0)
        press_diff2 = reada(b, 's', 0)
        temperature = reada(b, 's', 0)
    }
}

