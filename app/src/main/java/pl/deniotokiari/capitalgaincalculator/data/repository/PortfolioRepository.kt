package pl.deniotokiari.capitalgaincalculator.data.repository

import kotlinx.coroutines.flow.Flow
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.data.datasource.PortfolioDataSource
import pl.deniotokiari.capitalgaincalculator.data.model.Portfolio

@Factory
class PortfolioRepository(
    private val portfolioDataSource: PortfolioDataSource
) {
    suspend fun exists(name: String): Boolean = portfolioDataSource.exists(name)

    suspend fun addPortfolio(portfolio: Portfolio) = portfolioDataSource.addPortfolio(portfolio)

    fun portfolios(): Flow<List<Portfolio>> = portfolioDataSource.portfolios()
}