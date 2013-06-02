
/*
        Set the setpoint for a local position controller. This is the
        position in local coordinates the MAV should fly to. This
        message is sent by the path/MISSION planner to the onboard
        position controller. As some MAVs have a degree of freedom in
        yaw (e.g. all helicopters/quadrotors), the desired yaw angle
        is part of the message.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SET_LOCAL_POSITION_SETPOINT"
    static crcExtra = 214
    static fieldNames = ["target_system", "target_component", "coordinate_frame", "x", "y", "z", "yaw"]

    target_system = 0
    target_component = 0
    coordinate_frame = 0
    x = 0
    y = 0
    z = 0
    yaw = 0

    function packPayload(b) {
        writea(b, x, 'f', 0)
        writea(b, y, 'f', 0)
        writea(b, z, 'f', 0)
        writea(b, yaw, 'f', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, coordinate_frame, 'b', 0)
    }
    function unpackPayload(b) {
        x = reada(b, 'f', 0)
        y = reada(b, 'f', 0)
        z = reada(b, 'f', 0)
        yaw = reada(b, 'f', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        coordinate_frame = reada(b, 'b', 0)
    }
}

