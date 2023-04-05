
void main() async {
  // It's ok to use
  String name = await Future.value("John Wick");
  print(name);

  print("Loading...");

  // It's not ok to use for ***long running fetching
  Future<String> delayedNameFuture = Future.delayed(Duration(seconds: 4), () => "John Wick");
  String delayedName = await delayedNameFuture;
  print(delayedName);

  Future<String> errorFuture = Future.error(NullThrownError());
  try {
    print(await errorFuture);
  } catch(error) {
    print(error.toString());
  }
}