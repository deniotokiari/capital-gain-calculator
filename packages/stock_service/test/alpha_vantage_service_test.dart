import 'package:flutter_test/flutter_test.dart';
import 'package:stock_service/src/alphavantage/alpha_vantage_service.dart';

void main() {
  test(
    'Request executed before reaching limits positive case',
    () async {
      final sut = AlphaVantageService(
        requestsPerMinute: 5,
        requestsPerDay: 500,
        nowDateTime: DateTime.now,
      );

      final result = await sut.executeWithRequestsLimitCheck(
        () async => 'RESULT',
      );

      expect(result, 'RESULT');
    },
  );

  test(
    'Request executed before reaching limits negative case',
    () async {
      final sut = AlphaVantageService(
        requestsPerMinute: 5,
        requestsPerDay: 500,
        nowDateTime: DateTime.now,
      );

      await expectLater(
          sut.executeWithRequestsLimitCheck(
            () async => throw Exception('FAILURE'),
          ),
          throwsA(isA<Exception>()));
    },
  );

  test(
    'should clear requests per minute limit for new minute',
    () async {
      var time = DateTime.now();
      final sut = AlphaVantageService(
        requestsPerMinute: 1,
        requestsPerDay: 500,
        nowDateTime: () => time,
      );

      var result = await sut.executeWithRequestsLimitCheck(
        () async => 'RESULT',
      );

      expect(
        result,
        'RESULT',
      );

      time = time.add(const Duration(minutes: 1));
      result = await sut.executeWithRequestsLimitCheck(
        () async => 'RESULT',
      );

      expect(
        result,
        'RESULT',
      );
    },
  );

  test(
    'should clear requests per day for new day',
    () async {
      var time = DateTime.now();
      final sut = AlphaVantageService(
        requestsPerMinute: 5,
        requestsPerDay: 1,
        nowDateTime: () => time,
      );

      var result = await sut.executeWithRequestsLimitCheck(
        () async => 'RESULT',
      );

      expect(
        result,
        'RESULT',
      );

      time = time.add(const Duration(days: 1));
      result = await sut.executeWithRequestsLimitCheck(
        () async => 'RESULT',
      );

      expect(
        result,
        'RESULT',
      );
    },
  );

  test(
    'should throw RequestsLimitReached in case of reaching day limit',
    () async {
      final sut = AlphaVantageService(
        requestsPerMinute: 5,
        requestsPerDay: 1,
        nowDateTime: () => DateTime.now(),
      );

      var result = await sut.executeWithRequestsLimitCheck(
        () async => 'RESULT',
      );

      expect(
        result,
        'RESULT',
      );

      await expectLater(
        sut.executeWithRequestsLimitCheck(() async => 'RESULT'),
        throwsA(isA<RequestsLimitReached>()),
      );
    },
  );
}
