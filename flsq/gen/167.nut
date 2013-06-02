
/*
        Status of AP_Limits. Sent in extended             status
        stream when AP_Limits is enabled
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "LIMITS_STATUS"
    static crcExtra = 144
    static fieldNames = ["limits_state", "last_trigger", "last_action", "last_recovery", "last_clear", "breach_count", "mods_enabled", "mods_required", "mods_triggered"]

    limits_state = 0
    last_trigger = 0
    last_action = 0
    last_recovery = 0
    last_clear = 0
    breach_count = 0
    mods_enabled = 0
    mods_required = 0
    mods_triggered = 0

    function packPayload(b) {
        writea(b, last_trigger, 'i', 0)
        writea(b, last_action, 'i', 0)
        writea(b, last_recovery, 'i', 0)
        writea(b, last_clear, 'i', 0)
        writea(b, breach_count, 'w', 0)
        writea(b, limits_state, 'b', 0)
        writea(b, mods_enabled, 'b', 0)
        writea(b, mods_required, 'b', 0)
        writea(b, mods_triggered, 'b', 0)
    }
    function unpackPayload(b) {
        last_trigger = reada(b, 'i', 0)
        last_action = reada(b, 'i', 0)
        last_recovery = reada(b, 'i', 0)
        last_clear = reada(b, 'i', 0)
        breach_count = reada(b, 'w', 0)
        limits_state = reada(b, 'b', 0)
        mods_enabled = reada(b, 'b', 0)
        mods_required = reada(b, 'b', 0)
        mods_triggered = reada(b, 'b', 0)
    }
}

