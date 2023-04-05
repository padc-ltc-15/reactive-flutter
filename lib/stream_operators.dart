
/**
 * Stream Operators
 * ----------------
 * Filtering - where
 *
 * Transformational - map
 *
 * Conditional - take, skip
 *
 * Async Expand - asyncExpand
 *
 * Operators that produce single value - join, reduce, toList, toSet
 */
void main() async {

  var elements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  Stream<int> numbersStream = Stream
      .fromIterable(elements as Iterable<int>);

  // All numbers
  numbersStream
    .listen((event) {
      print("Number: ${event}");
    });

  // Even numbers
  // Filtering operator
  numbersStream.where((event) => event.isEven)
    .listen((event) {
      print("Even number (Filtered): ${event}");
    });

  // First Even number
  // Filtering operator
  numbersStream.firstWhere((event) => event.isEven)
    .asStream()
    .listen((event) {
      print("First even number (Filtered): ${event}");
    });

  // Last Even number
  // Filtering operator
  numbersStream.lastWhere((event) => event.isEven)
      .then((value) {
        print("Last even number (Filtered): ${value}");
    });

  // ---------------------------------------------------------------------------

  // Doubled number
  // Transformational operator
  var stringNumbersStream = numbersStream
      .map((event) {
        return "Doubled value of ${event} is ${event * 2}";
      });

  stringNumbersStream.listen((event) {
    print(event);
  });

  // ---------------------------------------------------------------------------

  // Take <= 5 numbers
  // Conditional operator
  numbersStream
      .takeWhile((element) => element <= 5)
      .listen((event) {
        print("Take <= 5 number (Conditioned): ${event}");
      });

  // Skip <= 5 numbers
  // Conditional operator
  numbersStream
      .skipWhile((element) => element <= 5)
      .listen((event) {
    print("Skip <= 5 number (Conditioned): ${event}");
  });

  numbersStream
      .take(10)
      .listen((event) {
        print("Number (Conditioned): ${event}");
      });

  // ---------------------------------------------------------------------------

  // Async Expand
  Stream<List<int>> numberListStream = Stream.value(elements);
  numberListStream.asyncExpand((event) => Stream.fromIterable(event))
      .map((event) {
        return "Async Expand Doubled value of ${event} is ${event * 2}";
      })
      .listen((event) {
        print(event);
      });

  // ---------------------------------------------------------------------------

  // Operator that produces single value
  numbersStream.reduce((previous, element) {
      return previous + element;
    })
    .then((value) => print("Total (Reduced): ${value}"));

  numbersStream.join(",")
    .then((value) {
      print("Joined string (Joined): ${value}");
    });

  numbersStream.toList()
    .then((value) => print("Converted to list (toList): ${value}"));

  numbersStream.toSet()
      .then((value) => print("Converted to list (toSet): ${value}"));
}