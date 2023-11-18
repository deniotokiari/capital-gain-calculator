package pl.deniotokiari.capitalgaincalculator.core.network

import okhttp3.OkHttpClient

const val ANONYMOUS = "anonymous"
const val ALPHA_VANTAGE = "alpha_vantage"

val anonymous = OkHttpClient()

fun queryAuthorized(param: String, value: String) = OkHttpClient().newBuilder()
    .addInterceptor { chain ->
        chain.proceed(chain.request().newBuilder().also { requestBuilder ->
            requestBuilder.url(chain.request().url.newBuilder().also { urlBuilder ->
                urlBuilder.setQueryParameter(param, value)
            }.build())
        }.build())
    }
    .build()
