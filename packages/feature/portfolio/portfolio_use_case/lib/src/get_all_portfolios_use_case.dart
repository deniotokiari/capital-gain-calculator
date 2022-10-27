import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';

class GetAllPortfoliosUseCase extends UseCase<void, Future<List<Portfolio>>> {
  final db.PortfolioRepository _portfolioRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  GetAllPortfoliosUseCase(
    this._portfolioRepository,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Future<List<Portfolio>> execute(void args) async {
    final items = await _portfolioRepository.all();
    final result = <Portfolio>[];

    for (var item in items) {
      result.add(
        Portfolio(
          id: item.id,
          name: item.name,
          physicalCurrency: await _getPhysicalCurrencyByIdUseCase.execute(
            item.physicalCurrencyId,
          ),
        ),
      );
    }

    return result;
  }
}
