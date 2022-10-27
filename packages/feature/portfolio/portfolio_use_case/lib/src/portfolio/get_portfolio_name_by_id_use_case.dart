import 'package:common/common.dart';
import 'package:db/db.dart' as db;

class GetPortfolioNameByIdUseCase implements UseCase<String, Future<String>> {
  final db.PortfolioRepository _portfolioRepository;

  GetPortfolioNameByIdUseCase(this._portfolioRepository);

  @override
  Future<String> execute(String args) => _portfolioRepository.get(args).then((value) => value.name);
}
