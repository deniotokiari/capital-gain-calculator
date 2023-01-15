import 'package:alphavantage/alphavantage.dart';
import 'package:auth/auth.dart';
import 'package:cloud_store/cloud_store.dart';
import 'package:sign_up/sign_up.dart';
import 'package:utility/utility.dart';

class AppModule extends DependencyModule {
  @override
  Future<void> init() async {
    for (var e in [
      CloudStoreModule(),
      AlphavantageModule(),
      AuthModule(),
      SignUpModule(),
    ]) {
      await e.init();
    }
  }
}
