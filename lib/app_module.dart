import 'package:auth/auth.dart';
import 'package:capital_gain_calculator/navigation/app_navigation.dart';
import 'package:capital_gain_calculator/navigation/auth_guard.dart';
import 'package:currency/currency.dart';
import 'package:home/home.dart';
import 'package:portfolio/portfolio.dart';
import 'package:sign_in/sign_in.dart';
import 'package:splash/splash.dart';
import 'package:sign_up/sign_up.dart';
import 'package:store/store.dart';
import 'package:user/user.dart';
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
