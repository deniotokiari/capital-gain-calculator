abstract class DbEntity {
  String? _id;

  String get id {
    _id ??= itemsForId.map((item) => item?.hashCode ?? 0).join();

    return _id!;
  }

  Iterable<dynamic> get itemsForId;

  Map<String, dynamic> get map;
}
