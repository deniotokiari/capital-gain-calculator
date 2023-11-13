package pl.deniotokiari.capitalgaincalculator.domain

import org.koin.androidx.workmanager.dsl.workerOf
import org.koin.core.module.dsl.factoryOf
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetCurrenciesUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.UpdateCurrenciesUseCase
import pl.deniotokiari.capitalgaincalculator.domain.work.UpdateCurrenciesWorker

val domainModule = module {
    factoryOf(::UpdateCurrenciesUseCase)
    factoryOf(::GetCurrenciesUseCase)

    workerOf(::UpdateCurrenciesWorker)
}