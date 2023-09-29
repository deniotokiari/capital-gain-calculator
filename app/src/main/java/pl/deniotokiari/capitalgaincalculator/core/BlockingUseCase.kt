package pl.deniotokiari.capitalgaincalculator.core

interface BlockingUseCase<in T, out P> {
    operator fun invoke(params: T): P
}