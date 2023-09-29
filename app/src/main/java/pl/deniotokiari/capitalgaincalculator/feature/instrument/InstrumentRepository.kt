package pl.deniotokiari.capitalgaincalculator.feature.instrument

class InstrumentRepository(
    private val instrumentDao: InstrumentDao
) {
    suspend fun addInstrument(symbolId: String, portfolioId: String) = instrumentDao.insert(
        DbInstrument(
            portfolioId = portfolioId,
            symbolId = symbolId
        )
    )
}