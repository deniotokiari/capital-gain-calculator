import 'package:data_instrument/data_instrument.dart';
import 'package:store/repository/db_repository.dart';

class InstrumentRepository extends DbRepository<Instrument> {
  InstrumentRepository(super.space, super.map, super.db);

  Instrument getById(String id) => get(id);

  Iterable<Instrument> getByPortfolioId(String portfolioId) => all().where((element) => element.portfolioId == portfolioId);

  Stream<Iterable<Instrument>> getUpdatesByPortfolioId(String portfolioId) => updates().map(
        (event) => event.where(
          (element) => element.portfolioId == portfolioId,
        ),
      );
}
