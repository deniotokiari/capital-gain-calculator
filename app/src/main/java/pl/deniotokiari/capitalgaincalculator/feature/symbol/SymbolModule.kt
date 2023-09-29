package pl.deniotokiari.capitalgaincalculator.feature.symbol

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.db.AppDatabase

val symbolModule = module {
    factory { get<AppDatabase>().symbolDao() }
    singleOf(::SymbolLocalDataSource)
    singleOf(::SymbolRemoteDataSource)
    singleOf(::SymbolRepository)
    factoryOf(::SymbolSearchByQueryUseCase)
}