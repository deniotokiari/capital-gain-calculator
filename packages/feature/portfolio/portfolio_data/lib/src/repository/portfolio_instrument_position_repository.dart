import 'package:common/common.dart';
import 'package:portfolio_data/src/model/portfolio_instrument_position.dart';

class PortfolioInstrumentPositionRepository {
  final LocalStorage _localStorage;

  PortfolioInstrumentPositionRepository(this._localStorage);

  Future<void> add(PortfolioInstrumentPosition position) => _localStorage.save(position);

  Future<List<PortfolioInstrumentPosition>> getPositionsByInstrumentId(String id) async {
    final instruments = await _localStorage.collection(
      PortfolioInstrumentPosition.fromMap,
      where: (map) => map['portfolioInstrumentId'] == id,
    );

    return [...instruments];
  }

  Stream<PortfolioInstrumentPosition> get stream => _localStorage.stream(
        PortfolioInstrumentPosition.fromMap,
      );
}
