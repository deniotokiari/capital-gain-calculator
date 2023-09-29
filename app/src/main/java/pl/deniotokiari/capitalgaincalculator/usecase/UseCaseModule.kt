package pl.deniotokiari.capitalgaincalculator.usecase

import org.koin.core.module.dsl.factoryOf
import org.koin.dsl.module

val useCaseModule = module {
    factoryOf(::GetAlphaVantageApiBlockingUseCase)
    factoryOf(::GetFiatAndCurrencyListBlockingUseCase)
    factoryOf(::UpdateCurrencyListUseCase)
    factoryOf(::SetAlphaVantageApiKeyUseCase)
    factoryOf(::GetCurrencyByCodeUseCase)
    factoryOf(::SetProfileCurrencyUseCase)
    factoryOf(::GetProfileCurrencyBlockingUseCase)
    factoryOf(::GetPortfoliosBlockingUseCase)
    factoryOf(::AddPortfolioUseCase)
    factoryOf(::DeletePortfolioUseCase)
}