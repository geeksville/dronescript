
function mkString(seq, separator = "") {
    local r = ""
    foreach(idx, val in seq) {
	if(idx != 0)
	    r += separator

	r += val
    }

    return r
}

function map(seq, fn) {
    foreach(val in seq) {
      yield fn(val)
    }
}
