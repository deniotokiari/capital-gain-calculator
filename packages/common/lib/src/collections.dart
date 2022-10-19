extension ListExt<T> on List<T> {
  Iterable<P> mapNotNull<P>(P? Function(T) toElement) {
    final result = List<P>.empty(growable: true);

    for (var item in this) {
      final e = toElement(item);

      if (e != null) {
        result.add(e);
      }
    }

    return result;
  }
}
