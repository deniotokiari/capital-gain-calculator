import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqfLite implements Storage {
  final Map<Type, List<String>> _tables;

  SqfLite(this._tables);

  String _getName(Type type) => type.toString();

  Future<Database> _getDatabase() =>
      openDatabase('data.db', version: 1, onCreate: (Database db, int version) async {
        for (final item in _tables.entries) {
          await db.execute(
            'CREATE TABLE ${_getName(item.key)} (${item.value.join(', ')})',
          );
        }
      });

  @override
  Future<String> add(DbEntity entity) async {
    final db = await _getDatabase();

    final id = await db.insert(
      _getName(entity.runtimeType),
      entity.toMap
        ..putIfAbsent(
          'id',
          () => entity.id,
        ),
    );

    return id.toString();
  }

  @override
  Future addAll(Iterable<DbEntity> items) async {
    final db = await _getDatabase();
    await db.transaction((txn) async {
      for (final item in items) {
        await txn.insert(
          _getName(item.runtimeType),
          item.toMap
            ..putIfAbsent(
              'id',
              () => item.id,
            ),
        );
      }
    });
  }

  @override
  Future<Iterable<Map<String, dynamic>>> all(Type type) async {
    final db = await _getDatabase();

    return await db.query(_getName(type));
  }

  @override
  Future<void> delete(Iterable<DbEntity> items) async {
    final db = await _getDatabase();

    await db.transaction((txn) async {
      for (final item in items) {
        await txn.delete(
          _getName(item.runtimeType),
          where: 'id = ?',
          whereArgs: [item.id],
        );
      }
    });
  }

  @override
  Future<Map<String, dynamic>> get(Type type, String id) async {
    final db = await _getDatabase();

    final result = await db.query(
      _getName(type),
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.first;
  }

  @override
  Stream<Map<String, dynamic>> stream(Type type) async* {
    // NOP
  }

  @override
  Future<Iterable<Map<String, dynamic>>> where(
      Type type, bool Function(Map<String, dynamic> map) where) async {
    final db = await _getDatabase();

    final result = await db.query(_getName(type));

    return result.where(where);
  }
}
