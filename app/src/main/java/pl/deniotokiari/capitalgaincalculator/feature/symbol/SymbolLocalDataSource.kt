package pl.deniotokiari.capitalgaincalculator.feature.symbol

class SymbolLocalDataSource(
    private val symbolDao: SymbolDao
) {
    suspend fun addSymbol(symbol: Symbol) = symbolDao.insert(symbol.toDbSymbol())
}