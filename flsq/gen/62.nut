
/*
        Outputs of the APM navigation controller. The primary use of
        this message is to check the response and signs of the
        controller before actual flight and to assist with tuning
        controller parameters.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "NAV_CONTROLLER_OUTPUT"
    static crcExtra = 183
    static fieldNames = ["nav_roll", "nav_pitch", "nav_bearing", "target_bearing", "wp_dist", "alt_error", "aspd_error", "xtrack_error"]

    nav_roll = 0
    nav_pitch = 0
    nav_bearing = 0
    target_bearing = 0
    wp_dist = 0
    alt_error = 0
    aspd_error = 0
    xtrack_error = 0

    function packPayload(b) {
        writea(b, nav_roll, 'f', 0)
        writea(b, nav_pitch, 'f', 0)
        writea(b, alt_error, 'f', 0)
        writea(b, aspd_error, 'f', 0)
        writea(b, xtrack_error, 'f', 0)
        writea(b, nav_bearing, 's', 0)
        writea(b, target_bearing, 's', 0)
        writea(b, wp_dist, 'w', 0)
    }
    function unpackPayload(b) {
        nav_roll = reada(b, 'f', 0)
        nav_pitch = reada(b, 'f', 0)
        alt_error = reada(b, 'f', 0)
        aspd_error = reada(b, 'f', 0)
        xtrack_error = reada(b, 'f', 0)
        nav_bearing = reada(b, 's', 0)
        target_bearing = reada(b, 's', 0)
        wp_dist = reada(b, 'w', 0)
    }
}

