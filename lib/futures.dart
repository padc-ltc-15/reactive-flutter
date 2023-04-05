
void main() {
  Future<String> nameFuture = Future.value("John Wick");
  nameFuture.then((value) => print(value));

  Future<String> errorFuture = Future.error(NullThrownError());
  errorFuture
      .then((value) => print(value))
      .catchError((error) => print(error.toString()));

  Future<String> delayedNameFuture = Future.delayed(Duration(seconds: 4), () => "John Wick");
  delayedNameFuture.then((value) => print(value));
}