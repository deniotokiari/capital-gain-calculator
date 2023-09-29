package pl.deniotokiari.capitalgaincalculator.network

import okhttp3.OkHttpClient
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module

val networkModule = module {
    singleOf(::OkHttpClient)
}