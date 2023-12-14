package pl.deniotokiari.domain.work

import android.content.Context
import androidx.work.Constraints
import androidx.work.CoroutineWorker
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.NetworkType
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkerParameters
import org.koin.android.annotation.KoinWorker
import pl.deniotokiari.core.common.fold
import pl.deniotokiari.domain.usecase.currency.UpdateCurrenciesUseCase
import java.util.concurrent.TimeUnit

@KoinWorker
class UpdateCurrenciesWorker(
    context: Context,
    parameters: WorkerParameters,
    private val updateCurrenciesUseCase: UpdateCurrenciesUseCase
) : CoroutineWorker(context, parameters) {
    override suspend fun doWork(): Result {
        return updateCurrenciesUseCase(Unit).fold(
            success = { Result.success() },
            failed = { Result.retry() }
        )
    }

    companion object {
        private const val WORK_NAME = "UpdateCurrenciesWorker"
        private const val REPEAT_INTERVAL = 30L
        private val REPEAT_INTERVAL_TIME_UNIT = TimeUnit.DAYS

        fun start(workManager: WorkManager) {
            val request = PeriodicWorkRequestBuilder<UpdateCurrenciesWorker>(
                repeatInterval = REPEAT_INTERVAL,
                repeatIntervalTimeUnit = REPEAT_INTERVAL_TIME_UNIT
            )
                .setConstraints(Constraints(requiredNetworkType = NetworkType.CONNECTED))
                .build()

            workManager.enqueueUniquePeriodicWork(WORK_NAME, ExistingPeriodicWorkPolicy.KEEP, request)
        }
    }
}