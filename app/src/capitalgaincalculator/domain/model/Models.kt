package legacy.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.DataError

@JvmInline
value class DomainError(val throwable: Throwable)

fun DataError.toDomainError(): DomainError = DomainError(throwable)