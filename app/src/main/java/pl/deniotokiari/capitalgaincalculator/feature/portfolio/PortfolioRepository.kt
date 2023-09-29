package pl.deniotokiari.capitalgaincalculator.feature.portfolio

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import pl.deniotokiari.capitalgaincalculator.feature.instrument.InstrumentRepository
import pl.deniotokiari.capitalgaincalculator.feature.symbol.Symbol
import pl.deniotokiari.capitalgaincalculator.feature.symbol.SymbolRepository
import pl.deniotokiari.capitalgaincalculator.feature.symbol.toDbSymbol
import pl.deniotokiari.capitalgaincalculator.feature.symbol.toSymbol

class PortfolioRepository(
    private val portfolioDao: PortfolioDao,
    private val symbolRepository: SymbolRepository,
    private val instrumentRepository: InstrumentRepository
) {
    fun getPortfolios(): Flow<List<Portfolio>> = portfolioDao.getAll().map { items ->
        items.map { item -> item.toPortfolio() }
    }

    suspend fun addPortfolio(portfolio: Portfolio) = portfolioDao.insert(portfolio.toDbPortfolio())

    suspend fun deletePortfolio(id: String) = portfolioDao.delete(id)

    suspend fun addSymbolToPortfolio(symbol: Symbol, portfolio: Portfolio) {
        symbolRepository.addSymbol(symbol)
        instrumentRepository.addInstrument(
            symbolId = symbol.toDbSymbol().id,
            portfolioId = portfolio.toDbPortfolio().id
        )
    }

    fun getPortfolioSymbols(portfolioId: String): Flow<List<Symbol>> =
        portfolioDao.getPortfolioSymbols(portfolioId).map { items ->
            items.map { item -> item.toSymbol() }
        }

    suspend fun getPortfolioById(id: String): Portfolio = portfolioDao.getPortfolioById(id).toPortfolio()
}