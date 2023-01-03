import 'package:dio/dio.dart';

const _nbpCurrency = 'https://www.nbp.pl/kursy/Archiwum/archiwum_tab_a_%year.csv';

class NbpService {
  final String _year;
  Dio? _dio;

  NbpService(this._year);

  Dio get _service {
    _dio ??= Dio(BaseOptions(
      baseUrl: _nbpCurrency.replaceAll('%year', _year),
      responseType: ResponseType.plain,
    ));

    return _dio!;
  }

  Future<String> getArchive() async {
    return await _service.get('').then((value) => value.data);
  }
}
