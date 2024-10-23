package pl.deniotokiari.core.misc

sealed class Result<out T, out E> {
    data class Success<out T>(val data: T) : Result<T, Nothing>()
    data class Error<out E>(val error: E) : Result<Nothing, E>()

    inline fun <R> fold(
        onSuccess: (value: T) -> R,
        onError: (error: E) -> R
    ): R {
        return when (this) {
            is Success -> onSuccess(data)
            is Error -> onError(error)
        }
    }

    inline fun <R> then(transform: (value: T) -> Result<R, @UnsafeVariance E>): Result<R, E> {
        return when (this) {
            is Success -> transform(data)
            is Error -> this
        }
    }

    inline fun getOrNull(): T? = when (this) {
        is Error -> null
        is Success -> data
    }

    inline fun errorOrNull(): E? = when (this) {
        is Error -> error
        is Success -> null
    }
}

fun <T> T.ok() = Result.Success(this)

fun <E> E.error() = Result.Error(this)