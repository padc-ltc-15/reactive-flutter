
// streams can emit more than one values

void main() async {

  var elements = [1, 2, 3, 4, 5];

  Stream<int> numbersStream = Stream
      .fromIterable(elements)
      .asBroadcastStream(); // broadcast no need now
  numbersStream.listen((event) {
    print(event);
  });
  numbersStream.listen((event) {
    print(event);
  });

  Stream<List<int>> numberListStream = Stream.value(elements);
  numberListStream.listen((event) {
    print(event);
  });

  Stream<int> errorStream = Stream.error(NullThrownError());
  errorStream.listen((event) {
    print(event);
  })
  .onError((error) {
    print(error.toString());
  });
}