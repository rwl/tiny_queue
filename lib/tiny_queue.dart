/// Simple FIFO queue implementation
library tiny_queue;

class _Node {
  final value;
  _Node next;
  _Node(this.value);
}

class Queue {

  int _length = 0;
	_Node _first;
  _Node _last;

  /// Returns the number of elements in this queue.
  get length => _length;

  /// Adds value at the end of this queue.
  push(item){
  	_Node node = new _Node(item);

    if(this._last != null){
      this._last = this._last.next = node;
    }
    else{
      this._last = this._first = node;
    }

    this._length++;
  }

  /// Removes and returns the first element of this queue
  shift(){
    _Node node = this._first;

    if(node != null){
			this._first = node.next;
      this._length--;
      if(this.length == 0){
        this._last = null;
      }
      return node.value;
    }
  }

  List slice(int start, int end){
    List output = [];
    var i = 0;
    for (_Node node = this._first; node != null; node = node.next) {
      if (--end < 0) {
        break;
      } else if (++i > start) {
        output.add(node.value);
      }
    }
    return output;
  }
}
