library user;

import 'package:user/src/repository/user_id_repository.dart';
import 'package:user/src/repository/user_settings_repository.dart';
import 'package:utility/utility.dart';

export 'src/repository/user_settings_repository.dart';
export 'src/repository/user_id_repository.dart';

class UserModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(() => UserIdRepository(get()));
    registerLazySingleton(() => UserSettingsRepository(get()));
  }
}
