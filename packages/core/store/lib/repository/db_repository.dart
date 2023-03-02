import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:store/source/cloud_firestore_db_source.dart';
import 'package:store/store.dart';

class DbRepository<T extends DbEntity> {
  final Space _space;
  final T Function(Map<String, dynamic>) _map;
  final CloudFirestoreDbSource _db;

  final Map<String, T> _items = {};

  final StreamController<Map<String, T>> _streamController = StreamController.broadcast();

  DbRepository(
    this._space,
    this._map,
    this._db,
  ) {
    _db.updates(_space, _map).listen((event) {
      for (final item in event.removed) {
        _items.remove(item.id);
      }

      for (final item in event.modifayed) {
        _items[item.id] = item;
      }

      for (final item in event.added) {
        _items[item.id] = item;
      }

      _streamController.add(_items);
    });
  }

  Future<void> add(T item) => _db.add(_space, item);

  @protected
  T get(String id) => _items[id]!;

  @protected
  T? getOrNull(String id) => _items[id];

  @protected
  Iterable<T> all() => _items.values;

  @protected
  Stream<Iterable<T>> updates() => _streamController.stream.map((it) => it.values);

  Future<void> delete(String id) => _db.delete<T>(_space, id);
}
