library data_user;

import 'package:data_user/src/repository/user_id_repository.dart';
import 'package:data_user/src/repository/user_settings_repository.dart';
import 'package:utility/utility.dart';

export 'src/repository/user_settings_repository.dart';
export 'src/repository/user_id_repository.dart';

class DataUserModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(() => UserIdRepository(get()));
    registerLazySingleton(() => UserSettingsRepository(get()));
  }
}
