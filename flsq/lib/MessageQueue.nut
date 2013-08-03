


class QueueEmptyException extends Exception {}
class QueueFullException extends Exception {}

class Message {
}



// A ring buffer - burning one slot to make the code easy
class MessageQueue {
    arr = null
    start = 0
    end = 0

    constructor(maxLen) {
		arr = array(maxLen + 1)
    }

    function isFull() {
		return (end + 1) % arr.len() == start
    }

    function isEmpty() {
		return end == start
    }

    function enqueue(msg) {
		if(isFull())
			throw QueueFullException()

		arr[end] = msg
		end = (end + 1) % arr.len()
    }
    
    // Returns null if empty
    function dequeue() {
		if(isEmpty())
			throw QueueEmptyException()

		local r = arr[start]
		start = (start + 1) % arr.len()
		return r
    }
}

