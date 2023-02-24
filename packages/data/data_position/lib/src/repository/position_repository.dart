import 'package:data_position/data_position.dart';
import 'package:store/repository/db_repository.dart';

class PositionRepository extends DbRepository<Position> {
  PositionRepository(super.space, super.map, super.db);
}
