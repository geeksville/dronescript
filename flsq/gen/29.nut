
/*
        The pressure readings for the typical setup of one absolute
        and differential pressure sensor. The units are as specified
        in each field.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SCALED_PRESSURE"
    static crcExtra = 115
    static fieldNames = ["time_boot_ms", "press_abs", "press_diff", "temperature"]

    time_boot_ms = 0
    press_abs = 0
    press_diff = 0
    temperature = 0

    function packPayload(b) {
        writea(b, time_boot_ms, 'i', 0)
        writea(b, press_abs, 'f', 0)
        writea(b, press_diff, 'f', 0)
        writea(b, temperature, 's', 0)
    }
    function unpackPayload(b) {
        time_boot_ms = reada(b, 'i', 0)
        press_abs = reada(b, 'f', 0)
        press_diff = reada(b, 'f', 0)
        temperature = reada(b, 's', 0)
    }
}

