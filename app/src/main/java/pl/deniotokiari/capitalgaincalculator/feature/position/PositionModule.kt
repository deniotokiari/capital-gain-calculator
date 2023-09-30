package pl.deniotokiari.capitalgaincalculator.feature.position

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.db.AppDatabase
import pl.deniotokiari.capitalgaincalculator.feature.position.usecase.AddPositionToInstrumentUseCase

val positionModule = module {
    factory { get<AppDatabase>().positionDao() }
    singleOf(::PositionRepository)
    factoryOf(::AddPositionToInstrumentUseCase)
}