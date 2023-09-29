package pl.deniotokiari.capitalgaincalculator.currency

import android.content.Context
import android.util.Log
import androidx.work.Constraints
import androidx.work.CoroutineWorker
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.NetworkType
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkerParameters
import pl.deniotokiari.capitalgaincalculator.usecase.UpdateCurrencyListUseCase
import java.util.concurrent.TimeUnit

class CurrencyUpdateWorker(
    context: Context,
    parameters: WorkerParameters,
    private val updateCurrencyListUseCase: UpdateCurrencyListUseCase
) : CoroutineWorker(context, parameters) {
    override suspend fun doWork(): Result {
        Log.d("WORKER", "start CurrencyUpdateWorker")

        updateCurrencyListUseCase(Unit)

        Log.d("WORKER", "end CurrencyUpdateWorker")

        return Result.success()
    }

    companion object {
        private const val WORKER_NAME = "CurrencyUpdateWorker"

        fun start(context: Context) {
            val request = PeriodicWorkRequestBuilder<CurrencyUpdateWorker>(
                repeatInterval = 30,
                repeatIntervalTimeUnit = TimeUnit.DAYS
            )
                .setConstraints(Constraints.Builder().setRequiredNetworkType(NetworkType.CONNECTED).build())
                .build()

            WorkManager.getInstance(context)
                .enqueueUniquePeriodicWork(WORKER_NAME, ExistingPeriodicWorkPolicy.KEEP, request)
        }
    }
}