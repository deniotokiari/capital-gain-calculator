package pl.deniotokiari.capital.gain.calculator.feature.auth.di

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.auth.data.AuthDataSource
import pl.deniotokiari.capital.gain.calculator.feature.auth.data.getPlatformAuthDataSource
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.GetUserIdUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.IsAuthRequiredFlowUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.IsAuthRequiredUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.LoginUserWithEmailAndPasswordUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.SignupUserWithEmailAndPasswordUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthViewModel

val authModule = module {
    single<AuthDataSource> { getPlatformAuthDataSource() }

    factoryOf(::IsAuthRequiredUseCase)
    factoryOf(::SignupUserWithEmailAndPasswordUseCase)
    factoryOf(::LoginUserWithEmailAndPasswordUseCase)
    factoryOf(::IsAuthRequiredFlowUseCase)
    factoryOf(::GetUserIdUseCase)

    viewModelOf(::AuthViewModel)
}