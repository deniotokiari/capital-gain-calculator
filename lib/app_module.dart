import 'package:capital_gain_calculator/navigation/app_navigation.dart';
import 'package:capital_gain_calculator/navigation/auth_guard.dart';
import 'package:data_auth/auth.dart';
import 'package:data_currency/currency.dart';
import 'package:data_portfolio/portfolio.dart';
import 'package:data_user/user.dart';
import 'package:feature_home/home.dart';
import 'package:feature_sign_in/sign_in.dart';
import 'package:feature_sign_up/sign_up.dart';
import 'package:feature_splash/splash.dart';
import 'package:store/store.dart';
import 'package:utility/utility.dart';

class AppModule extends DependencyModule {
  @override
  Future<void> init() async {
    for (var e in <DependencyModule>[
      CurrencyModule(),
      StoreModule(() => get<UserIdRepository>().getUserId()),
      AuthModule(),
      SplashModule(),
      SignInModule(),
      SignUpModule(),
      HomeModule(),
      PortfolioModule(),
      UserModule(),
    ]) {
      await e.init();
    }

    registerSingleton(
        AppRouter(authGuard: AuthGuard(() => get<UserIdRepository>().getUserId())));
  }
}
