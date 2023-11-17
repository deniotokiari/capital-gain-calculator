package pl.deniotokiari.capitalgaincalculator.data.datasource

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.AppDispatchers
import pl.deniotokiari.capitalgaincalculator.data.db.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModelList
import pl.deniotokiari.capitalgaincalculator.data.db.toDbModel
import pl.deniotokiari.capitalgaincalculator.data.model.Portfolio

interface PortfolioDataSource {
    fun portfolios(): Flow<List<Portfolio>>

    suspend fun addPortfolio(portfolio: Portfolio)

    suspend fun exists(name: String): Boolean
}

@Factory
class PortfolioRoomDataSource(
    private val portfolioDao: DbPortfolio.PortfolioDao,
    private val appDispatchers: AppDispatchers
) : PortfolioDataSource {
    override fun portfolios(): Flow<List<Portfolio>> = portfolioDao.portfolios().map {
        it.toDataModelList()
    }.flowOn(appDispatchers.io)

    override suspend fun exists(name: String): Boolean = withContext(appDispatchers.io) {
        portfolioDao.getPortfolioByName(name) != null
    }

    override suspend fun addPortfolio(portfolio: Portfolio) = withContext(appDispatchers.io) {
        portfolioDao.addPortfolio(portfolio.toDbModel())
    }
}

