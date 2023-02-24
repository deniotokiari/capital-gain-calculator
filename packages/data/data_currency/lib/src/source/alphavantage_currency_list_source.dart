import 'package:data_currency/src/currency.dart';
import 'package:data_currency/src/source/currency_list_source.dart';
import 'package:dio/dio.dart';

class AlphavantageCurrencyListSource implements CurrencyListSource {
  final _service = Dio(BaseOptions(
    baseUrl: 'https://www.alphavantage.co',
    responseType: ResponseType.plain,
  ));

  @override
  Future<List<Currency>> getCurrencyList() async {
    try {
      final response = await _service.get('/physical_currency_list').then((value) => value.data as String);

      return [
        Currency(code: 'GBX', name: 'British Penny Sterling'),
        ...response.split('\n').skip(1).where((e) => e.isNotEmpty).map(
          (e) {
            final row = e.split(',');
            final code = row.first;
            final name = row.last;

            return Currency(
              code: code,
              name: name,
            );
          },
        )
      ]..sort((a, b) => a.code.compareTo(b.code));
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> addCurrencyList(List<Currency> list) => Future.value();
}
