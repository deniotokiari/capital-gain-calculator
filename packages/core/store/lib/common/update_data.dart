class UpdateData<T> {
  final List<T> added;
  final List<T> removed;
  final List<T> modifayed;

  UpdateData({
    required this.added,
    required this.removed,
    required this.modifayed,
  });
}
