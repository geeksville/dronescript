
/*
        Offsets and calibrations values for hardware         sensors.
        This makes it easier to debug the calibration process.
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "SENSOR_OFFSETS"
    static crcExtra = 134
    static fieldNames = ["mag_ofs_x", "mag_ofs_y", "mag_ofs_z", "mag_declination", "raw_press", "raw_temp", "gyro_cal_x", "gyro_cal_y", "gyro_cal_z", "accel_cal_x", "accel_cal_y", "accel_cal_z"]

    mag_ofs_x = 0
    mag_ofs_y = 0
    mag_ofs_z = 0
    mag_declination = 0
    raw_press = 0
    raw_temp = 0
    gyro_cal_x = 0
    gyro_cal_y = 0
    gyro_cal_z = 0
    accel_cal_x = 0
    accel_cal_y = 0
    accel_cal_z = 0

    function packPayload(b) {
        writea(b, mag_declination, 'f', 0)
        writea(b, raw_press, 'i', 0)
        writea(b, raw_temp, 'i', 0)
        writea(b, gyro_cal_x, 'f', 0)
        writea(b, gyro_cal_y, 'f', 0)
        writea(b, gyro_cal_z, 'f', 0)
        writea(b, accel_cal_x, 'f', 0)
        writea(b, accel_cal_y, 'f', 0)
        writea(b, accel_cal_z, 'f', 0)
        writea(b, mag_ofs_x, 's', 0)
        writea(b, mag_ofs_y, 's', 0)
        writea(b, mag_ofs_z, 's', 0)
    }
    function unpackPayload(b) {
        mag_declination = reada(b, 'f', 0)
        raw_press = reada(b, 'i', 0)
        raw_temp = reada(b, 'i', 0)
        gyro_cal_x = reada(b, 'f', 0)
        gyro_cal_y = reada(b, 'f', 0)
        gyro_cal_z = reada(b, 'f', 0)
        accel_cal_x = reada(b, 'f', 0)
        accel_cal_y = reada(b, 'f', 0)
        accel_cal_z = reada(b, 'f', 0)
        mag_ofs_x = reada(b, 's', 0)
        mag_ofs_y = reada(b, 's', 0)
        mag_ofs_z = reada(b, 's', 0)
    }
}

