library feature_sign_in;

import 'package:feature_sign_in/src/bloc/sign_in_bloc.dart';
import 'package:usecase_sign_in/sign_in_use_case.dart';
import 'package:utility/utility.dart';

export 'src/widget/sign_in_page.dart';

class FeatureSignInModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(() => SignInBloc(SignInUseCase(get())));
  }
}
