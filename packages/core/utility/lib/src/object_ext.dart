extension ObjectExtension<T, P> on P? {
  T? let(T Function(P it) action) {
    final current = this;

    if (current != null) {
      return action(current);
    } else {
      return null;
    }
  }
}
