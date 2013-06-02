
/*
        Optical flow from an omnidirectional flow sensor (e.g. PX4FLOW
        with wide angle lens)
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "OMNIDIRECTIONAL_FLOW"
    static crcExtra = 211
    static fieldNames = ["time_usec", "sensor_id", "left", "right", "quality", "front_distance_m"]

    time_usec = 0
    sensor_id = 0
    left = 0
    right = 0
    quality = 0
    front_distance_m = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, front_distance_m, 'f', 0)
        writea(b, left, 's', 10)
        writea(b, right, 's', 10)
        writea(b, sensor_id, 'b', 0)
        writea(b, quality, 'b', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        front_distance_m = reada(b, 'f', 0)
        left = reada(b, 's', 10)
        right = reada(b, 's', 10)
        sensor_id = reada(b, 'b', 0)
        quality = reada(b, 'b', 0)
    }
}

