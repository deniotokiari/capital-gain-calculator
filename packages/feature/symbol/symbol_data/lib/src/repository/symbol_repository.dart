import 'package:common/common.dart';
import 'package:symbol_data/src/model/symbol.dart';

class SymbolRepository {
  final LocalStorage _localStorage;

  SymbolRepository(this._localStorage);

  Future<void> add(Symbol symbol) => _localStorage.save(symbol);

  Future<List<Symbol>> getItemsById(Iterable<String> ids) =>
      _localStorage.collection(Symbol.fromMap).then(
            (value) => value
                .where(
                  (element) => ids.contains(element.id),
                )
                .toList(growable: false),
          );
}
