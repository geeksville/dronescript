
/*
        The positioning status, as reported by GPS. This message is
        intended to display status information about each satellite
        visible to the receiver. See message GLOBAL_POSITION for the
        global position estimate. This message can contain information
        for up to 20 satellites.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "GPS_STATUS"
    static crcExtra = 23
    static fieldNames = ["satellites_visible", "satellite_prn", "satellite_used", "satellite_elevation", "satellite_azimuth", "satellite_snr"]

    satellites_visible = 0
    satellite_prn = 0
    satellite_used = 0
    satellite_elevation = 0
    satellite_azimuth = 0
    satellite_snr = 0

    function packPayload(b) {
        writea(b, satellites_visible, 'b', 0)
        writea(b, satellite_prn, 'b', 20)
        writea(b, satellite_used, 'b', 20)
        writea(b, satellite_elevation, 'b', 20)
        writea(b, satellite_azimuth, 'b', 20)
        writea(b, satellite_snr, 'b', 20)
    }
    function unpackPayload(b) {
        satellites_visible = reada(b, 'b', 0)
        satellite_prn = reada(b, 'b', 20)
        satellite_used = reada(b, 'b', 20)
        satellite_elevation = reada(b, 'b', 20)
        satellite_azimuth = reada(b, 'b', 20)
        satellite_snr = reada(b, 'b', 20)
    }
}

