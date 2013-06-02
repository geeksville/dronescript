
/*
        The system time is the time of the master clock, typically the
        computer clock of the main onboard computer.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SYSTEM_TIME"
    static crcExtra = 137
    static fieldNames = ["time_unix_usec", "time_boot_ms"]

    time_unix_usec = 0
    time_boot_ms = 0

    function packPayload(b) {
        writea(b, time_unix_usec, 'l', 0)
        writea(b, time_boot_ms, 'i', 0)
    }
    function unpackPayload(b) {
        time_unix_usec = reada(b, 'l', 0)
        time_boot_ms = reada(b, 'i', 0)
    }
}

