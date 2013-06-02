
/*
        A fence point. Used to set a point when from               GCS
        -> MAV. Also used to return a point from MAV -> GCS
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "FENCE_POINT"
    static crcExtra = 78
    static fieldNames = ["target_system", "target_component", "idx", "count", "lat", "lng"]

    target_system = 0
    target_component = 0
    idx = 0
    count = 0
    lat = 0
    lng = 0

    function packPayload(b) {
        writea(b, lat, 'f', 0)
        writea(b, lng, 'f', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, idx, 'b', 0)
        writea(b, count, 'b', 0)
    }
    function unpackPayload(b) {
        lat = reada(b, 'f', 0)
        lng = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        idx = reada(b, 'b', 0)
        count = reada(b, 'b', 0)
    }
}

