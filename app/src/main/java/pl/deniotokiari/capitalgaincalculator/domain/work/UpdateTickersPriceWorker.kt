package pl.deniotokiari.capitalgaincalculator.domain.work

import android.content.Context
import androidx.work.Constraints
import androidx.work.CoroutineWorker
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.NetworkType
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkerParameters
import org.koin.android.annotation.KoinWorker
import pl.deniotokiari.capitalgaincalculator.domain.usecase.UpdateTickersPriceUseCase
import java.util.concurrent.TimeUnit

@KoinWorker
class UpdateTickersPriceWorker(
    context: Context,
    parameters: WorkerParameters,
    private val updateTickersPriceUseCase: UpdateTickersPriceUseCase
) : CoroutineWorker(context, parameters) {
    override suspend fun doWork(): Result {
        updateTickersPriceUseCase(Unit)

        return Result.success()
    }

    companion object {
        private const val WORK_NAME = "update_tickers_price"
        private const val REPEAT_INTERVAL = 6L
        private val REPEAT_INTERVAL_TIME_UNIT = TimeUnit.HOURS

        fun start(workManager: WorkManager) {
            val request = PeriodicWorkRequestBuilder<UpdateTickersPriceWorker>(
                repeatInterval = REPEAT_INTERVAL,
                repeatIntervalTimeUnit = REPEAT_INTERVAL_TIME_UNIT
            ).setConstraints(
                Constraints
                    .Builder()
                    .setRequiredNetworkType(NetworkType.CONNECTED)
                    .build()
            )
                .build()

            workManager.enqueueUniquePeriodicWork(
                WORK_NAME,
                ExistingPeriodicWorkPolicy.KEEP,
                request
            )
        }
    }
}