import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';
import 'package:localstore/localstore.dart';

class LocalStore implements Storage {
  final _db = Localstore.instance;

  String _getName(Type type) => type.toString();

  @override
  Future<String> add(DbEntity entity) async {
    await _db
        .collection(
          _getName(entity.runtimeType),
        )
        .doc(entity.id)
        .set(
          entity.toMap,
          SetOptions(merge: true),
        );

    return entity.id;
  }

  @override
  Future addAll(Iterable<DbEntity> items) => Future.forEach(items, add);

  @override
  Future<Iterable<Map<String, dynamic>>> all(Type type) async {
    final dbResult = await _db.collection(_getName(type)).get();

    return dbResult?.entries.map((item) => item.value) ?? [];
  }

  @override
  Future<void> delete(Iterable<DbEntity> items) => Future.forEach<DbEntity>(
      items,
      (item) => _db
          .collection(
            _getName(item.runtimeType),
          )
          .doc(item.id)
          .delete());

  @override
  Future<Map<String, dynamic>> get(Type type, String id) =>
      _db.collection(_getName(type)).doc(id).get().then((value) => value!);

  bool _contains(Map<String, dynamic> a, List<Map<String, dynamic>>? b) {
    return b?.any((e) => a.toString() == e.toString()) ?? false;
  }

  @override
  Stream<Map<String, dynamic>> stream(Type type) async* {
    final items = await _db
        .collection(_getName(type))
        .get()
        .then((value) => value?.entries.map<Map<String, dynamic>>((e) => e.value).toList());

    await for (final item in _db.collection(_getName(type)).stream) {
      if (!_contains(item, items)) {
        items?.add(item);

        yield item;
      }
    }
  }

  @override
  Future<Iterable<Map<String, dynamic>>> where(
      Type type, bool Function(Map<String, dynamic> map) where) async {
    final dbResult = await _db.collection(_getName(type)).get();

    return dbResult?.entries.where((item) => where(item.value)).map((item) => item.value) ?? [];
  }
}
