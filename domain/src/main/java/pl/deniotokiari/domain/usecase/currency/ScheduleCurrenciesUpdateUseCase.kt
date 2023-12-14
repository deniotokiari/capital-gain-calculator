package pl.deniotokiari.domain.usecase.currency

import androidx.work.WorkManager
import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.UseCase
import pl.deniotokiari.domain.work.UpdateCurrenciesWorker

@Factory(binds = [ScheduleCurrenciesUpdateUseCase::class])
class ScheduleCurrenciesUpdateUseCase(
    private val workManager: WorkManager
) : UseCase<Unit, Unit> {
    override suspend fun invoke(params: Unit) {
        UpdateCurrenciesWorker.start(workManager)
    }
}