/// Simple FIFO queue implementation
library tiny_queue;

import 'package:js/js.dart';

@JS()
class Queue {
  external push(arg);
  external shift();
  external List slice();
  external int get length;
}
