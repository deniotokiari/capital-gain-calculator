package pl.deniotokiari.core.common

import kotlinx.coroutines.flow.Flow

interface UseCase<in A, out B> {
    suspend operator fun invoke(params: A): B
}

interface FlowUseCase<in A, out B> {
    operator fun invoke(params: A): Flow<B>
}
