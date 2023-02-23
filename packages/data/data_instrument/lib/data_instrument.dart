library data_instrument;

import 'package:data_instrument/src/model/instrument.dart';
import 'package:data_instrument/src/repository/instrument_repository.dart';
import 'package:store/common/space.dart';
import 'package:utility/utility.dart';

export 'src/model/instrument.dart';
export 'src/repository/instrument_repository.dart';

class DataInstrumentModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(() => InstrumentRepository(Space.user, Instrument.fromMap, get()));
  }
}
