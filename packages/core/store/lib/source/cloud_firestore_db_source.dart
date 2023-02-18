import 'package:cloud_firestore/cloud_firestore.dart' as db;
import 'package:flutter/foundation.dart';
import 'package:store/common/query.dart';
import 'package:store/common/space.dart';
import 'package:store/model/db_entity.dart';

class CloudFirestoreDbSource {
  final _db = db.FirebaseFirestore.instance;
  final ValueGetter<String?> _userId;

  CloudFirestoreDbSource(this._userId);

  Future<void> add(Space space, DbEntity entity) async {
    await _getSpace(space).collection(_dbName(entity.runtimeType)).doc(entity.id).set(entity.map);
  }

  Future<T> get<T extends DbEntity>(Space space, String id, T Function(Map<String, dynamic>) map) =>
      _getSpace(space).collection(_dbName(T)).doc(id).get().then((value) => map(value.data()!));

  Future<List<T>> all<T extends DbEntity>(
    Space space,
    T Function(Map<String, dynamic>) map, [
    List<Query> query = const [],
  ]) async {
    final collection = _getSpace(space).collection(_dbName(T));

    if (query.isEmpty) {
      return await collection.get().then((value) => value.docs.map((e) => map(e.data())).toList(growable: false));
    } else {
      late dynamic subQuery;

      for (final item in query) {
        subQuery = collection.where(
          item.field,
          isEqualTo: item.isEqualTo,
          isNotEqualTo: item.isNotEqualTo,
          isLessThan: item.isLessThan,
          isLessThanOrEqualTo: item.isLessThanOrEqualTo,
          isGreaterThan: item.isGreaterThan,
          isGreaterThanOrEqualTo: item.isGreaterThanOrEqualTo,
          arrayContains: item.arrayContains,
          arrayContainsAny: item.arrayContainsAny,
          whereIn: item.whereIn,
          whereNotIn: item.whereNotIn,
        );
      }

      return await subQuery.get().then((value) => value.docs.map((e) => map(e.data())).toList(growable: false));
    }
  }

  db.DocumentReference _getSpace(Space space) {
    switch (space) {
      case Space.user:
        return _db.collection('db').doc(space.title).collection(_userId()!).doc('entities');
      case Space.common:
        return _db.collection('db').doc(space.title);
    }
  }

  String _dbName(Type type) => type.toString();
}
