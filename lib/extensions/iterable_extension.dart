extension IterableExtension<E> on Iterable<E> {
  /// Similar to map method but includes an index as first argument.
  Iterable<T> mapIndex<T>(T Function(E element, int index) f) {
    int index = 0;
    return map((E element) => f(element, index++));
  }

  /// Similar to forEach method but includes an index as first argument.
  void forEachIndex(void Function(E element, int index) f) {
    int index = 0;
    forEach((E element) => f(element, index++));
  }
}
