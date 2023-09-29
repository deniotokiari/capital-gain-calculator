package pl.deniotokiari.capitalgaincalculator.feature.symbol

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.db.AppDatabase
import pl.deniotokiari.capitalgaincalculator.feature.symbol.symbolslist.GetSymbolsByPortfolioIdBlockingUseCase
import pl.deniotokiari.capitalgaincalculator.feature.symbol.symbolslist.SymbolsListViewModel

val symbolModule = module {
    factory { get<AppDatabase>().symbolDao() }
    singleOf(::SymbolLocalDataSource)
    singleOf(::SymbolRemoteDataSource)
    singleOf(::SymbolRepository)
    factoryOf(::SymbolSearchByQueryUseCase)
    factoryOf(::SymbolsListViewModel)
    factoryOf(::GetSymbolsByPortfolioIdBlockingUseCase)
}