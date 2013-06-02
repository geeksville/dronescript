
/*
        Send a command with up to four parameters to the MAV
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "COMMAND_LONG"
    static crcExtra = 152
    static fieldNames = ["target_system", "target_component", "command", "confirmation", "param1", "param2", "param3", "param4", "param5", "param6", "param7"]

    target_system = 0
    target_component = 0
    command = 0
    confirmation = 0
    param1 = 0
    param2 = 0
    param3 = 0
    param4 = 0
    param5 = 0
    param6 = 0
    param7 = 0

    function packPayload(b) {
        writea(b, param1, 'f', 0)
        writea(b, param2, 'f', 0)
        writea(b, param3, 'f', 0)
        writea(b, param4, 'f', 0)
        writea(b, param5, 'f', 0)
        writea(b, param6, 'f', 0)
        writea(b, param7, 'f', 0)
        writea(b, command, 'w', 0)
        writea(b, target_system, 'b', 0)
        writea(b, target_component, 'b', 0)
        writea(b, confirmation, 'b', 0)
    }
    function unpackPayload(b) {
        param1 = reada(b, 'f', 0)
        param2 = reada(b, 'f', 0)
        param3 = reada(b, 'f', 0)
        param4 = reada(b, 'f', 0)
        param5 = reada(b, 'f', 0)
        param6 = reada(b, 'f', 0)
        param7 = reada(b, 'f', 0)
        command = reada(b, 'w', 0)
        target_system = reada(b, 'b', 0)
        target_component = reada(b, 'b', 0)
        confirmation = reada(b, 'b', 0)
    }
}

