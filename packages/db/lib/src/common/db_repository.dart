import 'package:db/src/common/db_entity.dart';

abstract class DbRepository<T extends DbEntity> {
  static Storage? _storage;

  static setStorage(Storage storage) {
    _storage = storage;
  }

  T converter(Map<String, dynamic> map);

  Future<String> add(T entity) => _storage!.add(entity);

  Future addAll(Iterable<T> items) => _storage!.addAll(items);

  Future<T> get(String id) async {
    final result = await _storage!.get(T, id);

    return converter(result);
  }

  Future<Iterable<T>> where(
    bool Function(Map<String, dynamic>) where,
  ) async {
    final dbResult = await _storage!.where(T, where);

    return dbResult.map((item) => converter(item));
  }

  Future<Iterable<T>> all() async {
    final dbResult = await _storage!.all(T);

    return dbResult.map((item) => converter(item));
  }

  Future<void> delete(Iterable<T> items) => _storage!.delete(items);

  Stream<T> stream() => _storage!.stream(T).map((item) => converter(item));
}

abstract class Storage {
  Future<String> add(DbEntity entity);

  Future addAll(Iterable<DbEntity> items);

  Future<Map<String, dynamic>> get(Type type, String id);

  Future<Iterable<Map<String, dynamic>>> where(
    Type type,
    bool Function(Map<String, dynamic>) where,
  );

  Future<Iterable<Map<String, dynamic>>> all(Type type);

  Future<void> delete(Iterable<DbEntity> items);

  Stream<Map<String, dynamic>> stream(Type type);
}
