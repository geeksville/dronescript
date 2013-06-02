
/*
        Optical flow from a flow sensor (e.g. optical mouse sensor)
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "OPTICAL_FLOW"
    static crcExtra = 175
    static fieldNames = ["time_usec", "sensor_id", "flow_x", "flow_y", "flow_comp_m_x", "flow_comp_m_y", "quality", "ground_distance"]

    time_usec = 0
    sensor_id = 0
    flow_x = 0
    flow_y = 0
    flow_comp_m_x = 0
    flow_comp_m_y = 0
    quality = 0
    ground_distance = 0

    function packPayload(b) {
        writea(b, time_usec, 'l', 0)
        writea(b, flow_comp_m_x, 'f', 0)
        writea(b, flow_comp_m_y, 'f', 0)
        writea(b, ground_distance, 'f', 0)
        writea(b, flow_x, 's', 0)
        writea(b, flow_y, 's', 0)
        writea(b, sensor_id, 'b', 0)
        writea(b, quality, 'b', 0)
    }
    function unpackPayload(b) {
        time_usec = reada(b, 'l', 0)
        flow_comp_m_x = reada(b, 'f', 0)
        flow_comp_m_y = reada(b, 'f', 0)
        ground_distance = reada(b, 'f', 0)
        flow_x = reada(b, 's', 0)
        flow_y = reada(b, 's', 0)
        sensor_id = reada(b, 'b', 0)
        quality = reada(b, 'b', 0)
    }
}

