package pl.deniotokiari.capitalgaincalculator.feature.profile

import org.koin.core.module.dsl.singleOf
import org.koin.dsl.bind
import org.koin.dsl.module

val profileModule = module {
    singleOf(::ProfileRepositoryImpl) bind ProfileRepository::class
}