library tiny_queue.test;

import 'package:test/test.dart';
import 'package:tiny_queue/tiny_queue.dart';

main() => group('Queue', () {

    test('`push()`', () async {
      Queue queue = new Queue();
      expect(queue.length, 0);
      queue.push("A");
      expect(queue.length, 1);
      queue.push("B");
      expect(queue.length, 2);
    });

    test('`shift()`', () async {
      Queue queue = new Queue()
        ..push("A")
        ..push("B")
        ..push("C");

      expect(queue.shift(),"A");
      expect(queue.length, 2);
      expect(queue.shift(),"B");
      expect(queue.length, 1);
      expect(queue.shift(),"C");
      expect(queue.length, 0);
      expect(queue.shift(), null);
    });

    test('`slice()`', () async {
      Queue queue = new Queue()
        ..push("A")
        ..push("B")
        ..push("C");

      expect(queue.slice(0,0), []);
      expect(queue.slice(0,1), ["A"]);
      expect(queue.slice(0,2), ["A","B"]);
      expect(queue.slice(0,3), ["A","B","C"]);
      expect(queue.slice(0,10), ["A","B","C"]);
      expect(queue.slice(1,3), ["B","C"]);
    });
});
