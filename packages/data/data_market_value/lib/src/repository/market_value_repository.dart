import 'package:data_currency/currency.dart';
import 'package:data_instrument/data_instrument.dart';
import 'package:data_market_value/src/model/market_value.dart';
import 'package:data_portfolio/portfolio.dart';
import 'package:data_position/data_position.dart';
import 'package:data_symbol/data_symbol.dart';
import 'package:store/store.dart';
import 'package:utility/utility.dart';

class MarketValueRepository {
  final PositionRepository _positionRepository;
  final InstrumentRepository _instrumentRepository;
  final SymbolRepository _symbolRepository;
  final PortfolioRepository _portfolioRepository;
  final CurrencyExchangeRateRepository _currencyExchangeRateRepository;

  MarketValueRepository(
    this._positionRepository,
    this._instrumentRepository,
    this._symbolRepository,
    this._portfolioRepository,
    this._currencyExchangeRateRepository,
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

    if (positions.isEmpty) {
      return null;
    } else {
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
  }

  Future<List<MarketValue>?> getPortfolioMarketValue(String portfolioId, {bool force = false}) async {
    final portfolio = await _portfolioRepository.get(portfolioId);
    final instruments = await _instrumentRepository.all([Query('portfolio_id', isEqualTo: portfolioId)]);
    final instrumentsMarketValues = <MarketValue>[];

    for (final instrument in instruments) {
      final marketValue = await getInstrumentMarketValue(instrument.id, force: force);

      if (marketValue != null) {
        final current = await _currencyExchangeRateRepository.convert(from: marketValue.current, to: portfolio.currency);
        final invested = await _currencyExchangeRateRepository.convert(from: marketValue.invested, to: portfolio.currency);

        instrumentsMarketValues.add(MarketValue(count: marketValue.count, current: current, invested: invested));
      }
    }

    if (instrumentsMarketValues.isEmpty) {
      return null;
    } else {
      return instrumentsMarketValues;
    }
  }

  // need converter for currency, since portfolio could be in different currency then profile
  Future<MarketValue?> getProfileMarketValue({bool force = false}) async {}
}
