abstract class DbEntity {
  Iterable<dynamic> get itemsForId;
  Map<String, dynamic> get toMap;

  String? _id;

  String get id {
    _id ??= itemsForId.map((item) => item?.hashCode ?? 0).join();

    return _id!;
  }
}
