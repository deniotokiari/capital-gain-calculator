import 'package:capital_gain_calculator/navigation/app_navigation.dart';
import 'package:capital_gain_calculator/navigation/auth_guard.dart';
import 'package:data_auth/auth.dart';
import 'package:data_currency/currency.dart';
import 'package:data_portfolio/portfolio.dart';
import 'package:data_user/user.dart';
import 'package:feature_home/home.dart';
import 'package:feature_portfolio/feature_portfolio.dart';
import 'package:feature_sign_in/sign_in.dart';
import 'package:feature_sign_up/sign_up.dart';
import 'package:feature_splash/splash.dart';
import 'package:store/store.dart';
import 'package:utility/utility.dart';

class AppModule extends DependencyModule {
  @override
  Future<void> init() async {
    // CORE
    await Future.forEach([
      StoreModule(() => get<UserIdRepository>().getUserId()),
    ], (element) async => await element.init());

    // DATA
    await Future.forEach([
      DataCurrencyModule(),
      DataAuthModule(),
      DataUserModule(),
      DataPortfolioModule(),
    ], (element) async => await element.init());

    // FEATURE
    await Future.forEach([
      FeatureSplashModule(),
      FeatureSignInModule(),
      FeatureSignUpModule(),
      FeatureHomeModule(),
      FeaturePortfoluiModule(),
    ], (element) async => await element.init());

    registerSingleton(AppRouter(authGuard: AuthGuard(() => get<UserIdRepository>().getUserId())));
  }
}
