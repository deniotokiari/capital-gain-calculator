package pl.deniotokiari.capitalgaincalculator.currency

import okhttp3.OkHttpClient
import org.koin.androidx.workmanager.dsl.workerOf
import org.koin.core.module.dsl.singleOf
import org.koin.core.qualifier.named
import org.koin.dsl.bind
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.db.AppDatabase

val currencyModule = module {
    factory { get<AppDatabase>().currencyDao() }
    single {
        CurrencyRemoteDataSource(
            get<OkHttpClient>().newBuilder().build(),
            get(qualifier = named("IO"))
        )
    }
    singleOf(::CurrencyLocalDataSource)
    singleOf(::CurrencyRepositoryImpl) bind CurrencyRepository::class
    workerOf(::CurrencyUpdateWorker)
}