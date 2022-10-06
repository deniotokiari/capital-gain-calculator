import 'package:localstore/localstore.dart';

class LocalStorage {
  final _db = Localstore.instance;

  String _getName(Type type) => type.toString();

  Future<void> saveAll(List<LocalStorageEntity> items) async {
    return Future.forEach(items, save);
  }

  Future<void> save(
    LocalStorageEntity entity,
  ) {
    return _db
        .collection(
          _getName(entity.runtimeType),
        )
        .doc(entity.id)
        .set(
          entity.toMap,
          SetOptions(merge: true),
        );
  }

  Future<List<T>?> collection<T extends LocalStorageEntity>(
    T Function(Map<String, dynamic>) converter,
  ) {
    return _db.collection(_getName(T)).get().then(
          (value) => value?.entries
              .map<T>(
                (e) => converter(e.value),
              )
              .toList(growable: false),
        );
  }
}

abstract class LocalStorageEntity {
  String get id;
  Map<String, dynamic> get toMap;
}
