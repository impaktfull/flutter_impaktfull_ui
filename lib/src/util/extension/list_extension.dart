extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  bool all(bool Function(T) test) {
    for (var element in this) {
      if (!test(element)) return false;
    }
    return true;
  }
}
