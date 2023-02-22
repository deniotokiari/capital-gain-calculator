library feature_splash;

import 'package:feature_splash/src/bloc/splash_bloc.dart';
import 'package:utility/utility.dart';

export 'src/widget/splash_page.dart';

class FeatureSplashModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(() => SplashBloc(get()));
  }
}
