import 'package:db/src/common/db_entity.dart';
import 'package:localstore/localstore.dart';

abstract class DbRepository<T extends DbEntity> {
  final _db = Localstore.instance;

  T converter(Map<String, dynamic> map);

  String _getName(Type type) => type.toString();

  Future<String> add(T entity) async {
    await _db
        .collection(
          _getName(T),
        )
        .doc(entity.id)
        .set(
          entity.toMap,
          SetOptions(merge: true),
        );

    return entity.id;
  }

  Future addAll(Iterable<T> items) => Future.forEach(items, add);

  Future<T> get(String id) async {
    final result = await _db.collection(_getName(T)).doc(id).get();

    return converter(result!);
  }

  Future<Iterable<T>> where(
    bool Function(Map<String, dynamic>) where,
  ) async {
    final dbResult = await _db.collection(_getName(T)).get();

    return dbResult?.entries
            .where((item) => where(item.value))
            .map((item) => converter(item.value)) ??
        [];
  }

  Future<Iterable<T>> all() async {
    final dbResult = await _db.collection(_getName(T)).get();

    return dbResult?.entries.map((item) => converter(item.value)) ?? [];
  }

  Future<void> delete(Iterable<T> items) => Future.forEach<T>(
      items,
      (item) => _db
          .collection(
            _getName(T),
          )
          .doc(item.id)
          .delete());

  Stream<T> stream() => _db.collection(_getName(T)).stream.map(converter);
}
