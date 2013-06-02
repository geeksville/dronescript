
/*
        Report status of a command. Includes feedback wether the
        command was executed.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "COMMAND_ACK"
    static crcExtra = 143
    static fieldNames = ["command", "result"]

    command = 0
    result = 0

    function packPayload(b) {
        writea(b, command, 'w', 0)
        writea(b, result, 'b', 0)
    }
    function unpackPayload(b) {
        command = reada(b, 'w', 0)
        result = reada(b, 'b', 0)
    }
}

