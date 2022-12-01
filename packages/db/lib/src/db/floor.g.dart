// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloor {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorBuilder databaseBuilder(String name) => _$FloorBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorBuilder inMemoryDatabaseBuilder() => _$FloorBuilder(null);
}

class _$FloorBuilder {
  _$FloorBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<Floor> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$Floor();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$Floor extends Floor {
  _$Floor([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  InstrumentDao? _instrumentDaoInstance;

  PortfolioDao? _portfolioDaoInstance;

  Future<Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Instrument` (`id` TEXT NOT NULL, `portfolioId` TEXT NOT NULL, `symbolId` TEXT, `cryptoCurrencyId` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Portfolio` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `physicalCurrencyId` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  InstrumentDao get instrumentDao {
    return _instrumentDaoInstance ??= _$InstrumentDao(database, changeListener);
  }

  @override
  PortfolioDao get portfolioDao {
    return _portfolioDaoInstance ??= _$PortfolioDao(database, changeListener);
  }
}

class _$InstrumentDao extends InstrumentDao {
  _$InstrumentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _instrumentInsertionAdapter = InsertionAdapter(
            database,
            'Instrument',
            (Instrument item) => <String, Object?>{
                  'id': item.id,
                  'portfolioId': item.portfolioId,
                  'symbolId': item.symbolId,
                  'cryptoCurrencyId': item.cryptoCurrencyId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Instrument> _instrumentInsertionAdapter;

  @override
  Future<List<Instrument>> all() async {
    return _queryAdapter.queryList('SELECT * FROM Instrument',
        mapper: (Map<String, Object?> row) => Instrument(
            id: row['id'] as String,
            portfolioId: row['portfolioId'] as String,
            symbolId: row['symbolId'] as String?,
            cryptoCurrencyId: row['cryptoCurrencyId'] as String?));
  }

  @override
  Future<void> insertInstrument(Instrument item) async {
    await _instrumentInsertionAdapter.insert(item, OnConflictStrategy.abort);
  }
}

class _$PortfolioDao extends PortfolioDao {
  _$PortfolioDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _portfolioInsertionAdapter = InsertionAdapter(
            database,
            'Portfolio',
            (Portfolio item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'physicalCurrencyId': item.physicalCurrencyId
                });

  final DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Portfolio> _portfolioInsertionAdapter;

  @override
  Future<List<Portfolio>> all() async {
    return _queryAdapter.queryList('SELECT * FROM Portfolio',
        mapper: (Map<String, Object?> row) => Portfolio(
            id: row['id'] as String,
            name: row['name'] as String,
            physicalCurrencyId: row['physicalCurrencyId'] as String));
  }

  @override
  Future<void> insertPortfolio(Portfolio item) async {
    await _portfolioInsertionAdapter.insert(item, OnConflictStrategy.abort);
  }
}
