
import 'dart:async';
import 'package:async/async.dart';

void main() {
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  Stream<int> numberStream2 = Stream.fromIterable([11, 12, 13, 14, 15, 16, 17, 18, 19, 20]);

  StreamGroup.merge([numberStream, numberStream2]).listen((event) {
    print(event);
  });

  StreamZip([numberStream, numberStream2]).listen((p0) {
    print("Zipped: ${p0}");
  });
}