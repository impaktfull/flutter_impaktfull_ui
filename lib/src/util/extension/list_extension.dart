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

  void sortBy<R>(
    Comparable<R>? Function(T item) by, {
    bool ascending = true,
  }) {
    sort((a, b) {
      final byA = by(a);
      final byB = by(b);
      if (byA == null) return ascending ? -1 : 1;
      if (byB == null) return ascending ? 1 : -1;
      return _compareValues(byA, byB, ascending);
    });
  }

  void sortBy2<R, V>(
    Comparable<R>? Function(T item) by,
    Comparable<V>? Function(T item) by2, {
    bool ascending = true,
    bool ascending2 = true,
  }) {
    sort((a, b) {
      final byA = by(a);
      final byB = by(b);
      if (byA == null && byB != null) return ascending ? -1 : 1;
      if (byB == null && byA != null) return ascending ? 1 : -1;
      if (byA != null && byB != null) {
        final result = _compareValues(byA, byB, ascending);
        if (result != 0) return result;
      }

      final byA2 = by2(a);
      final byB2 = by2(b);
      if (byA2 == null && byB2 == null) return 0;
      if (byA2 == null) return ascending2 ? -1 : 1;
      if (byB2 == null) return ascending2 ? 1 : -1;
      return _compareValues(byA2, byB2, ascending2);
    });
  }
}

int _compareValues<T extends Comparable<dynamic>>(
  T a,
  T b,
  bool ascending,
) {
  if (identical(a, b)) return 0;
  if (ascending) return a.compareTo(b);
  return -a.compareTo(b);
}
