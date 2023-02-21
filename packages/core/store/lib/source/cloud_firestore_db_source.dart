import 'package:cloud_firestore/cloud_firestore.dart' as db;
import 'package:flutter/foundation.dart';
import 'package:store/store.dart';

class CloudFirestoreDbSource {
  final _db = db.FirebaseFirestore.instance;
  final ValueGetter<String?> _userId;

  CloudFirestoreDbSource(this._userId);

  Stream<UpdateData<T>> updates<T extends DbEntity>(Space space, T Function(Map<String, dynamic>) map) async* {
    final collection = _getSpace(space).collection(_dbName(T));

    await for (final snapshot in collection.snapshots()) {
      final added = <T>[];
      final removed = <T>[];
      final modified = <T>[];

      for (final change in snapshot.docChanges) {
        switch (change.type) {
          case db.DocumentChangeType.added:
            added.add(map(change.doc.data()!));

            break;
          case db.DocumentChangeType.removed:
            removed.add(map(change.doc.data()!));

            break;
          case db.DocumentChangeType.modified:
            modified.add(map(change.doc.data()!));

            break;
        }
      }

      yield UpdateData(
        added: added,
        removed: removed,
        modifayed: modified,
      );
    }
  }

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

  Future<void> delete<T extends DbEntity>(Space space, String id) async {
    await _getSpace(space).collection(_dbName(T)).doc(id).delete();
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
