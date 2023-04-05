
import 'dart:async';

void main() {

  /// Stream controller is asynchronous data stream
  StreamController<List<int>> numberStreamController = StreamController();

  /// Widgets
  /// Stream controller need to close when ui is destroyed
  numberStreamController.stream.listen((numberList) {
    print(numberList);
  });

  numberStreamController.sink.add([1, 2, 3]);
  numberStreamController.sink.add([4, 5, 6]);

  numberStreamController.close();
}