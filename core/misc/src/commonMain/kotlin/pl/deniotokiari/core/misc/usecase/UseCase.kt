package pl.deniotokiari.core.misc.usecase

import kotlinx.coroutines.flow.Flow

interface UseCase<in T, out P> {
    suspend operator fun invoke(input: T): P
}

interface FlowUseCase<in T, out P> {
    operator fun invoke(input: T): Flow<P>
}