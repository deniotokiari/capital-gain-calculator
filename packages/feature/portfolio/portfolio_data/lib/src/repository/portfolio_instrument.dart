import 'package:common/common.dart';
import 'package:portfolio_data/portfolio_data.dart';

class PortfolioInstrumentRepository {
  final LocalStorage _localStorage;

  PortfolioInstrumentRepository(this._localStorage);

  Future<void> add(PortfolioInstrument instrument) => _localStorage.save(instrument);

  Future<List<PortfolioInstrument>> getByPortfolioId(String portfolioId) async {
    final instruments = await _localStorage.collection(PortfolioInstrument.fromMap);

    return instruments
        .where((element) => element.portfolioId == portfolioId)
        .toList(growable: false);
  }
}
