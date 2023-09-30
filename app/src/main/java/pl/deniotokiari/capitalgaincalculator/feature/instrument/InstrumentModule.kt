package pl.deniotokiari.capitalgaincalculator.feature.instrument

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.db.AppDatabase
import pl.deniotokiari.capitalgaincalculator.feature.instrument.usecase.GetInstrumentIdBySymbolIdAndPortfolioIdUseCase

val instrumentModule = module {
    factory { get<AppDatabase>().instrumentDao() }
    singleOf(::InstrumentRepository)
    factoryOf(::GetInstrumentIdBySymbolIdAndPortfolioIdUseCase)
}