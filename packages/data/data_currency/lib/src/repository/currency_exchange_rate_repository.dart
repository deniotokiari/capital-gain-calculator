import 'package:data_currency/currency.dart';
import 'package:data_stock/data_stock.dart' as stock;
import 'package:store/repository/db_repository.dart';

class CurrencyExchangeRateRepository extends DbRepository<CurrencyExchangeRate> {
  final stock.StockRemoteSource _stockRemoteSource;
  final CurrencyListRepository _currencyListRepository;

  final Map<String, double> _rateMap = {};

  CurrencyExchangeRateRepository(
    this._stockRemoteSource,
    this._currencyListRepository,
    super.space,
    super.map,
    super.db,
  );

  Future<CurrencyValue> convert({required CurrencyValue from, required Currency to, bool force = false}) async {
    if (from.currency == to) {
      return from;
    } else if (from.currency.isGbx) {
      final gbp = await _currencyListRepository.getCurrencyByCode('gbp');

      return await convert(from: CurrencyValue(value: from.value * 0.009463, currency: gbp), to: to, force: force);
    } else if (to.isGbx) {
      final gbp = await _currencyListRepository.getCurrencyByCode('gbp');

      final result = await convert(from: from, to: gbp, force: force);

      return CurrencyValue(value: result.value / 0.009463, currency: to);
    }

    final id = CurrencyExchangeRate.generateId(from: from.currency, to: to);

    if (force) {
      _rateMap.remove(id);

      final rate = await _stockRemoteSource
          .currencyExchangeRate(from: from.currency.code, to: to.code)
          .then((value) => double.parse(value.currencyExchangeRate.exchangeRate));
      final currencyExchangeRate = CurrencyExchangeRate(from: from.currency, to: to, exchangeRate: rate);

      await add(currencyExchangeRate);

      _rateMap[id] = currencyExchangeRate.exchangeRate;
    }

    var rate = _rateMap[id] ?? await getOrNull(id).then((value) => value?.exchangeRate);

    if (rate == null) {
      return await convert(from: from, to: to, force: true);
    } else {
      _rateMap[id] = rate;

      return CurrencyValue(value: from.value * rate, currency: to);
    }
  }
}
