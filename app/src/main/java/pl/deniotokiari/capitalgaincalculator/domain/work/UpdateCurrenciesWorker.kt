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
import pl.deniotokiari.capitalgaincalculator.core.fold
import pl.deniotokiari.capitalgaincalculator.domain.usecase.UpdateCurrenciesUseCase
import java.util.concurrent.TimeUnit

@KoinWorker
class UpdateCurrenciesWorker(
    context: Context,
    parameters: WorkerParameters,
    private val updateCurrenciesUseCase: UpdateCurrenciesUseCase
) : CoroutineWorker(
    context, parameters
) {
    override suspend fun doWork(): Result = updateCurrenciesUseCase(Unit).fold(
        success = { Result.success() },
        failed = { Result.success() }
    )

    companion object {
        private const val WORK_NAME = "update_currencies"
        private const val REPEAT_INTERVAL = 30L
        private val REPEAT_INTERVAL_TIME_UNIT = TimeUnit.DAYS

        fun start(workManager: WorkManager) {
            val request = PeriodicWorkRequestBuilder<UpdateCurrenciesWorker>(
                repeatInterval = REPEAT_INTERVAL,
                repeatIntervalTimeUnit = REPEAT_INTERVAL_TIME_UNIT
            ).setConstraints(
                Constraints
                    .Builder()
                    .setRequiredNetworkType(NetworkType.CONNECTED)
                    .build()
            )
                .build()

            workManager.enqueueUniquePeriodicWork(WORK_NAME, ExistingPeriodicWorkPolicy.KEEP, request)
        }
    }
}