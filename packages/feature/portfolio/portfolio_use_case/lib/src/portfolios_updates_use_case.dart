import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';

class PortfoliosUpdatesUseCase implements UseCase<void, Stream<Portfolio>> {
  final db.PortfolioRepository _portfolioRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  PortfoliosUpdatesUseCase(
    this._portfolioRepository,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Stream<Portfolio> execute(void args) async* {
    await for (final item in _portfolioRepository.stream()) {
      yield Portfolio(
        id: item.id,
        name: item.name,
        physicalCurrency: await _getPhysicalCurrencyByIdUseCase.execute(
          item.physicalCurrencyId,
        ),
      );
    }
  }
}
