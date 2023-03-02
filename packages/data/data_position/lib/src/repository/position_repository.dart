import 'package:data_position/data_position.dart';
import 'package:store/repository/db_repository.dart';

class PositionRepository extends DbRepository<Position> {
  PositionRepository(super.space, super.map, super.db);

  Iterable<Position> getByInstrumentId(String instrumentId) => all().where((element) => element.instrumentId == instrumentId);

  Position getById(String id) => get(id);

  Stream<Iterable<Position>> getUpdatesByInstrumentId(String instrumentId) => updates().map(
        (event) => event.where(
          (element) => element.instrumentId == instrumentId,
        ),
      );

  Stream<Iterable<Position>> getUpdates() => updates();
}
