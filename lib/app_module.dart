import 'package:alphavantage/alphavantage.dart';
import 'package:auth/auth.dart';
import 'package:utility/utility.dart';

class AppModule extends DependencyModule {
  @override
  void init() {
    for (var e in [
      AlphavantageModule(),
      AuthModule(),
    ]) {
      e.init();
    }
  }
}
