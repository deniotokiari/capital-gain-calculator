import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';

class CreatePortfolioUseCase implements UseCase<CreatePortfolioUseCaseArguments, Future<void>> {
  final db.PortfolioRepository _portfolioRepository;

  CreatePortfolioUseCase(this._portfolioRepository);

  @override
  Future<void> execute(CreatePortfolioUseCaseArguments args) =>
      _portfolioRepository.add(db.Portfolio(
        name: args.name,
        physicalCurrencyId: args.physicalCurrency.id,
      ));
}

class CreatePortfolioUseCaseArguments {
  final String name;
  final PhysicalCurrency physicalCurrency;

  CreatePortfolioUseCaseArguments({
    required this.name,
    required this.physicalCurrency,
  });
}
