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
}