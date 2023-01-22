library sign_in;

import 'package:sign_in/src/bloc/sign_in_bloc.dart';
import 'package:utility/utility.dart';

export 'src/widget/sign_in_page.dart';

class SignInModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(() => SignInBloc());
  }
}
