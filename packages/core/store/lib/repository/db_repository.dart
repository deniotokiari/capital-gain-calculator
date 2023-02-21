import 'package:store/common/query.dart';
import 'package:store/common/space.dart';
import 'package:store/model/db_entity.dart';
import 'package:store/source/cloud_firestore_db_source.dart';

class DbRepository<T extends DbEntity> {
  final Space _space;
  final T Function(Map<String, dynamic>) _map;
  final CloudFirestoreDbSource _db;

  DbRepository(
    this._space,
    this._map,
    this._db,
  );

  Future<void> add(T item) => _db.add(_space, item);

  Future<T> get(String id) => _db.get(_space, id, _map);

  Future<List<T>> all([List<Query> query = const []]) => _db.all(_space, _map, query);

  Stream<List<T>> updates() => _db.updates(_space, _map);
}
