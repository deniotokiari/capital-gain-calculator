package legacy.capitalgaincalculator.core.network

import okhttp3.OkHttpClient
import org.koin.core.annotation.Named
import org.koin.core.annotation.Single

@Named(ANONYMOUS)
@Single
class AnonymousHttpClient : OkHttpClient()