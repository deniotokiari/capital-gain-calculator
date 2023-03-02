import 'package:data_instrument/data_instrument.dart';
import 'package:store/repository/db_repository.dart';

class InstrumentRepository extends DbRepository<Instrument> {
  InstrumentRepository(super.space, super.map, super.db);
}
