import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';

class GetPortfolioPhysicalCurrencyByInstrumentIdUseCase
    implements UseCase<String, Future<PhysicalCurrency>> {
  final db.InstrumentRepository _instrumentRepository;
  final db.PortfolioRepository _portfolioRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  GetPortfolioPhysicalCurrencyByInstrumentIdUseCase(
    this._instrumentRepository,
    this._portfolioRepository,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Future<PhysicalCurrency> execute(String args) async {
    final instrument = await _instrumentRepository.get(args);
    final portfolio = await _portfolioRepository.get(instrument.portfolioId);
    final physicalCurrency = await _getPhysicalCurrencyByIdUseCase.execute(
      portfolio.physicalCurrencyId,
    );

    return physicalCurrency;
  }
}
