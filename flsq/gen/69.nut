
/*
        This message provides an API for manually controlling the
        vehicle using standard joystick axes nomenclature, along with
        a joystick-like input device. Unused axes can be disabled an
        buttons are also transmit as boolean values of their
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "MANUAL_CONTROL"
    static crcExtra = 243
    static fieldNames = ["target", "x", "y", "z", "r", "buttons"]

    target = 0
    x = 0
    y = 0
    z = 0
    r = 0
    buttons = 0

    function packPayload(b) {
        writea(b, x, 's', 0)
        writea(b, y, 's', 0)
        writea(b, z, 's', 0)
        writea(b, r, 's', 0)
        writea(b, buttons, 'w', 0)
        writea(b, target, 'b', 0)
    }
    function unpackPayload(b) {
        x = reada(b, 's', 0)
        y = reada(b, 's', 0)
        z = reada(b, 's', 0)
        r = reada(b, 's', 0)
        buttons = reada(b, 'w', 0)
        target = reada(b, 'b', 0)
    }
}

