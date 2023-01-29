library splash;

import 'package:splash/src/bloc/splash_bloc.dart';
import 'package:utility/utility.dart';

export 'src/widget/splash_page.dart';

class SplashModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(() => SplashBloc(get()));
  }
}
