package pl.deniotokiari.capitalgaincalculator.core

interface UseCase<in T, out P> {
    suspend operator fun invoke(params: T): P
}