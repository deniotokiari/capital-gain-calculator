package legacy.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.core.fold
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.data.repository.TickerRepository

@Factory(binds = [SearchTickerUseCase::class])
class SearchTickerUseCase(
    private val tickerRepository: TickerRepository
) : UseCase<String, List<Ticker.Search>> {
    override suspend fun invoke(params: String): List<Ticker.Search> = tickerRepository.search(params)
        .fold(
            success = { it },
            failed = { emptyList() }
        )
}