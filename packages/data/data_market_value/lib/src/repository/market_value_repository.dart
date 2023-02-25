import 'package:data_currency/currency.dart';
import 'package:data_instrument/data_instrument.dart';
import 'package:data_market_value/src/model/market_value.dart';
import 'package:data_position/data_position.dart';
import 'package:data_symbol/data_symbol.dart';
import 'package:store/store.dart';
import 'package:utility/utility.dart';

class MarketValueRepository {
  final PositionRepository _positionRepository;
  final InstrumentRepository _instrumentRepository;
  final SymbolRepository _symbolRepository;

  MarketValueRepository(
    this._positionRepository,
    this._instrumentRepository,
    this._symbolRepository,
  );

  Future<Map<String, MarketValue?>> getPositionsMarketValue(String instrumentId, {bool force = false}) async {
    final positions = await _positionRepository.all([Query('instrument_id', isEqualTo: instrumentId)]);
    final instrument = await _instrumentRepository.get(instrumentId);
    final globalQuote = await _symbolRepository.globalQuote(instrument.symbolId, force: force);
    final map = <String, MarketValue?>{};

    for (final item in positions) {
      map[item.id] = globalQuote?.let((that) => MarketValue(count: item.count, current: that.close, invested: item.price));
    }

    return map;
  }

  Future<MarketValue?> getPositionMarketValue(String positionId, {bool force = false}) async {
    final position = await _positionRepository.get(positionId);
    final instrument = await _instrumentRepository.get(position.instrumentId);
    final globalQuote = await _symbolRepository.globalQuote(instrument.symbolId, force: force);

    return globalQuote?.let((that) => MarketValue(count: position.count, current: that.close, invested: position.price));
  }

  Future<MarketValue?> getInstrumentMarketValue(String instrumentId, {bool force = false}) async {
    final positions = await _positionRepository.all([Query('instrument_id', isEqualTo: instrumentId)]);
    final instrument = await _instrumentRepository.get(instrumentId);
    final globalQuote = await _symbolRepository.globalQuote(instrument.symbolId, force: force);

    return globalQuote?.let((that) => MarketValue(
          count: positions.fold(0.0, (previousValue, element) => previousValue + element.count),
          current: that.close,
          invested: positions.fold(
              CurrencyValue(
                value: 0.0,
                currency: globalQuote.close.currency,
              ),
              (previousValue, element) => previousValue + element.price),
        ));
  }

  // need converter for currency, since portfolio could contain instrument with different positions
  Future<MarketValue?> getPortfolioMarketValue(String portfolioId, {bool force = false}) async {}

  // need converter for currency, since portfolio could be in different currency then profile
  Future<MarketValue?> getProfileMarketValue({bool force = false}) async {}
}
