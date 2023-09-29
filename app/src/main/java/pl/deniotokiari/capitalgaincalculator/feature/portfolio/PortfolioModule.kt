package pl.deniotokiari.capitalgaincalculator.feature.portfolio

import org.koin.androidx.viewmodel.dsl.viewModelOf
import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.db.AppDatabase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.usecase.AddSymbolToPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.usecase.GetPortfolioByIdUseCase

val portfolioModule = module {
    factory { get<AppDatabase>().portfolioDao() }
    singleOf(::PortfolioRepository)
    viewModelOf(::PortfolioViewModel)
    factoryOf(::AddSymbolToPortfolioUseCase)
    factoryOf(::GetPortfolioByIdUseCase)
}