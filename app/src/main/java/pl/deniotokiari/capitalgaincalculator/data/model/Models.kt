package pl.deniotokiari.capitalgaincalculator.data.model

@JvmInline
value class ApiToke(val value: String)

@JvmInline
value class Id(val value: Long)

// errors

@JvmInline
value class DataError(val throwable: Throwable)