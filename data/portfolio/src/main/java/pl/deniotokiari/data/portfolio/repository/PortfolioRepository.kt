package pl.deniotokiari.data.portfolio.repository

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.data.portfolio.datasource.PortfolioRoomDataSource
import pl.deniotokiari.data.portfolio.model.DbPortfolio
import pl.deniotokiari.data.portfolio.model.Portfolio

@Factory
class PortfolioRepository(
    private val portfolioRoomDataSource: PortfolioRoomDataSource
) {
    suspend fun addPortfolio(portfolio: Portfolio) {
        portfolioRoomDataSource.addPortfolio(portfolio.toDbModel())
    }

    suspend fun deletePortfolio(name: String) {
        portfolioRoomDataSource.deletePortfolio(name)
    }

    fun getPortfolios(): Flow<List<Portfolio>> = portfolioRoomDataSource.getPortfolios().map { it.toDataModelList() }
}

private fun Portfolio.toDbModel(): DbPortfolio = DbPortfolio(
    name = name,
    currencyCode = currencyCode
)

private fun DbPortfolio.toDataModel(): Portfolio = Portfolio(
    name = name,
    currencyCode = currencyCode
)

private fun List<DbPortfolio>.toDataModelList(): List<Portfolio> = map { it.toDataModel() }