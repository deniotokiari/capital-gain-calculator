library data_position;

import 'package:data_position/src/model/position.dart';
import 'package:data_position/src/repository/position_repository.dart';
import 'package:store/common/space.dart';
import 'package:utility/utility.dart';

export 'src/model/position.dart';
export 'src/repository/position_repository.dart';

class DataPositionModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(() => PositionRepository(Space.user, Position.fromMap, get()));
  }
}
