library feature_sign_up;

import 'package:feature_sign_up/src/bloc/sign_up_bloc.dart';
import 'package:usecase_sign_up/sign_up_use_case.dart';
import 'package:utility/utility.dart';

export 'src/bloc/sign_up_bloc.dart';
export 'src/widget/sign_up_page.dart';

class SignUpModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(
      () => SignUpBloc(
        SignUpUseCase(
          get(),
          get(),
        ),
        get(),
      ),
    );
  }
}
