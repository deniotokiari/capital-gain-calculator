import 'package:flutter_test/flutter_test.dart';
import 'package:stock_service/src/model/physical_currency_list_response.dart';

const _csv = """currency code,currency name
AED,United Arab Emirates Dirham
AFN,Afghan Afghani
""";

void main() {
  test(
    'validate parsing',
    () {
      final sut = PhysicCurrencyListResponse(_csv);

      expect(sut.list.length, 2);
      expect(sut.list.first.code, 'AED');
      expect(sut.list.first.name, 'United Arab Emirates Dirham');
      expect(sut.list.last.code, 'AFN');
      expect(sut.list.last.name, 'Afghan Afghani');
    },
  );
}
