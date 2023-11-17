package pl.deniotokiari.capitalgaincalculator.data.datasource

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.AppDispatchers
import pl.deniotokiari.capitalgaincalculator.data.db.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.db.toDataCurrency
import pl.deniotokiari.capitalgaincalculator.data.db.toDbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.model.Portfolio

interface PortfolioDataSource {
    fun portfolios(): Flow<List<Portfolio>>

    suspend fun addPortfolio(portfolio: Portfolio)

    suspend fun exists(name: String): Boolean
}

@Factory
class PortfolioRoomDataSource(
    private val portfolioDao: DbPortfolio.Dao,
    private val appDispatchers: AppDispatchers
) : PortfolioDataSource {
    override fun portfolios(): Flow<List<Portfolio>> = portfolioDao.portfolios().map {
        it.map { item -> item.toDataCurrency() }
    }.flowOn(appDispatchers.io)

    override suspend fun exists(name: String): Boolean = withContext(appDispatchers.io) {
        portfolioDao.getPortfolioByName(name) != null
    }

    override suspend fun addPortfolio(portfolio: Portfolio) = withContext(appDispatchers.io) {
        portfolioDao.addPortfolio(portfolio.toDbPortfolio())
    }
}

