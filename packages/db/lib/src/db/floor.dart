import 'dart:async';

import 'package:floor/floor.dart';

part 'floor.g.dart';

@Database(version: 1, entities: [
  Instrument,
  Portfolio,
])
abstract class Floor extends FloorDatabase {
  InstrumentDao get instrumentDao;
  PortfolioDao get portfolioDao;
}

@entity
class Instrument {
  @primaryKey
  final String id;
  final String portfolioId;
  final String? symbolId;
  final String? cryptoCurrencyId;

  Instrument({
    required this.id,
    required this.portfolioId,
    required this.symbolId,
    required this.cryptoCurrencyId,
  });
}

@entity
class Portfolio {
  @primaryKey
  final String id;
  final String name;
  final String physicalCurrencyId;

  Portfolio({
    required this.id,
    required this.name,
    required this.physicalCurrencyId,
  });
}

@dao
abstract class InstrumentDao {
  @insert
  Future<void> insertInstrument(Instrument item);

  @Query('SELECT * FROM Instrument')
  Future<List<Instrument>> all();
}

@dao
abstract class PortfolioDao {
  @insert
  Future<void> insertPortfolio(Portfolio item);

  @Query('SELECT * FROM Portfolio')
  Future<List<Portfolio>> all();
}
