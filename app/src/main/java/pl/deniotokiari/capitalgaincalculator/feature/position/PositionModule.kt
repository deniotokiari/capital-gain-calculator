package pl.deniotokiari.capitalgaincalculator.feature.position

import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.db.AppDatabase

val positionModule = module {
    factory { get<AppDatabase>().positionDao() }
    singleOf(::PositionRepository)
}