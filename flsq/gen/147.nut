
/*
        Transmitte battery informations for a accu pack.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "BATTERY_STATUS"
    static crcExtra = 42
    static fieldNames = ["accu_id", "voltage_cell_1", "voltage_cell_2", "voltage_cell_3", "voltage_cell_4", "voltage_cell_5", "voltage_cell_6", "current_battery", "battery_remaining"]

    accu_id = 0
    voltage_cell_1 = 0
    voltage_cell_2 = 0
    voltage_cell_3 = 0
    voltage_cell_4 = 0
    voltage_cell_5 = 0
    voltage_cell_6 = 0
    current_battery = 0
    battery_remaining = 0

    function packPayload(b) {
        writea(b, voltage_cell_1, 'w', 0)
        writea(b, voltage_cell_2, 'w', 0)
        writea(b, voltage_cell_3, 'w', 0)
        writea(b, voltage_cell_4, 'w', 0)
        writea(b, voltage_cell_5, 'w', 0)
        writea(b, voltage_cell_6, 'w', 0)
        writea(b, current_battery, 's', 0)
        writea(b, accu_id, 'b', 0)
        writea(b, battery_remaining, 'c', 0)
    }
    function unpackPayload(b) {
        voltage_cell_1 = reada(b, 'w', 0)
        voltage_cell_2 = reada(b, 'w', 0)
        voltage_cell_3 = reada(b, 'w', 0)
        voltage_cell_4 = reada(b, 'w', 0)
        voltage_cell_5 = reada(b, 'w', 0)
        voltage_cell_6 = reada(b, 'w', 0)
        current_battery = reada(b, 's', 0)
        accu_id = reada(b, 'b', 0)
        battery_remaining = reada(b, 'c', 0)
    }
}

