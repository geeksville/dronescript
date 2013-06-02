
/*
        The general system state. If the system is following the
        MAVLink standard, the system state is mainly defined by three
        orthogonal states/modes: The system mode, which is either
        LOCKED (motors shut down and locked), MANUAL (system under RC
        control), GUIDED (system with autonomous position control,
        position setpoint controlled manually) or AUTO (system guided
        by path/waypoint planner). The NAV_MODE defined the current
        flight state: LIFTOFF (often an open-loop maneuver), LANDING,
        WAYPOINTS or VECTOR. This represents the internal navigation
        state machine. The system status shows wether the system is
        currently active or not and if an emergency occured. During
        the CRITICAL and EMERGENCY states the MAV is still considered
        to be active, but should start emergency procedures
        autonomously. After a failure occured it should first move
        from active to critical to allow manual intervention and then
        move to emergency after a certain timeout.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SYS_STATUS"
    static crcExtra = 124
    static fieldNames = ["onboard_control_sensors_present", "onboard_control_sensors_enabled", "onboard_control_sensors_health", "load", "voltage_battery", "current_battery", "battery_remaining", "drop_rate_comm", "errors_comm", "errors_count1", "errors_count2", "errors_count3", "errors_count4"]

    onboard_control_sensors_present = 0
    onboard_control_sensors_enabled = 0
    onboard_control_sensors_health = 0
    load = 0
    voltage_battery = 0
    current_battery = 0
    battery_remaining = 0
    drop_rate_comm = 0
    errors_comm = 0
    errors_count1 = 0
    errors_count2 = 0
    errors_count3 = 0
    errors_count4 = 0

    function packPayload(b) {
        writea(b, onboard_control_sensors_present, 'i', 0)
        writea(b, onboard_control_sensors_enabled, 'i', 0)
        writea(b, onboard_control_sensors_health, 'i', 0)
        writea(b, load, 'w', 0)
        writea(b, voltage_battery, 'w', 0)
        writea(b, current_battery, 's', 0)
        writea(b, drop_rate_comm, 'w', 0)
        writea(b, errors_comm, 'w', 0)
        writea(b, errors_count1, 'w', 0)
        writea(b, errors_count2, 'w', 0)
        writea(b, errors_count3, 'w', 0)
        writea(b, errors_count4, 'w', 0)
        writea(b, battery_remaining, 'c', 0)
    }
    function unpackPayload(b) {
        onboard_control_sensors_present = reada(b, 'i', 0)
        onboard_control_sensors_enabled = reada(b, 'i', 0)
        onboard_control_sensors_health = reada(b, 'i', 0)
        load = reada(b, 'w', 0)
        voltage_battery = reada(b, 'w', 0)
        current_battery = reada(b, 's', 0)
        drop_rate_comm = reada(b, 'w', 0)
        errors_comm = reada(b, 'w', 0)
        errors_count1 = reada(b, 'w', 0)
        errors_count2 = reada(b, 'w', 0)
        errors_count3 = reada(b, 'w', 0)
        errors_count4 = reada(b, 'w', 0)
        battery_remaining = reada(b, 'c', 0)
    }
}

