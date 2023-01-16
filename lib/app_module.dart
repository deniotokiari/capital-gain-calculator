import 'package:alphavantage/alphavantage.dart';
import 'package:auth/auth.dart';
import 'package:store/store.dart';
import 'package:sign_up/sign_up.dart';
import 'package:utility/utility.dart';

class AppModule extends DependencyModule {
  @override
  Future<void> init() async {
    for (var e in [
      StoreModule(),
      AlphavantageModule(),
      AuthModule(),
      SignUpModule(),
    ]) {
      await e.init();
    }
  }
}
