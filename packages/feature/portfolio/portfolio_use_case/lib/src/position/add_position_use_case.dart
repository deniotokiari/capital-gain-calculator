import 'package:common/common.dart';
import 'package:db/db.dart' as db;

class AddPositionUseCase implements UseCase<AddPositionUseCaseArguments, Future<void>> {
  final db.PositionRepository _positionRepository;

  AddPositionUseCase(this._positionRepository);

  @override
  Future<void> execute(AddPositionUseCaseArguments args) => _positionRepository.add(
        db.Position(
          instrumentId: args.instrumentId,
          count: args.count,
          date: args.date,
          price: args.price,
        ),
      );
}

class AddPositionUseCaseArguments {
  final String instrumentId;
  final double count;
  final double price;
  final DateTime date;

  AddPositionUseCaseArguments({
    required this.instrumentId,
    required this.count,
    required this.price,
    required this.date,
  });
}
