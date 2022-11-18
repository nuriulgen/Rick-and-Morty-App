class EndListException implements Exception {
  @override
  String toString() {
    return "You have reached the end of the character list.";
  }
}