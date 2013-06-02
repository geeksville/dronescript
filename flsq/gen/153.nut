
/*
        raw ADC output
*/
return class extends MAV.Message {
    constructor() {
        base.constructor()
    }
    static classname = "AP_ADC"
    static crcExtra = 188
    static fieldNames = ["adc1", "adc2", "adc3", "adc4", "adc5", "adc6"]

    adc1 = 0
    adc2 = 0
    adc3 = 0
    adc4 = 0
    adc5 = 0
    adc6 = 0

    function packPayload(b) {
        writea(b, adc1, 'w', 0)
        writea(b, adc2, 'w', 0)
        writea(b, adc3, 'w', 0)
        writea(b, adc4, 'w', 0)
        writea(b, adc5, 'w', 0)
        writea(b, adc6, 'w', 0)
    }
    function unpackPayload(b) {
        adc1 = reada(b, 'w', 0)
        adc2 = reada(b, 'w', 0)
        adc3 = reada(b, 'w', 0)
        adc4 = reada(b, 'w', 0)
        adc5 = reada(b, 'w', 0)
        adc6 = reada(b, 'w', 0)
    }
}

