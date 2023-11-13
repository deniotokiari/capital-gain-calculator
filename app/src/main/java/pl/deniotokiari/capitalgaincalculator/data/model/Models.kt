package pl.deniotokiari.capitalgaincalculator.data.model

@JvmInline
value class ApiToke(val value: String)

// errors

@JvmInline
value class DataError(val throwable: Throwable)