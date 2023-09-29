package pl.deniotokiari.capitalgaincalculator.alphavantage

import org.koin.core.module.dsl.singleOf
import org.koin.dsl.bind
import org.koin.dsl.module

val alphaVantageModule = module {
    singleOf(::AlphaVantageApiTokenRepositoryImpl) bind AlphaVantageApiTokenRepository::class
    single {
        AlphaVantageService.service(
            client = get(),
            apikey = get<AlphaVantageApiTokenRepository>().token
        )
    }
}