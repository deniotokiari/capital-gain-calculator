package pl.deniotokiari.capital.gain.calculator.platform.androidios.auth.data

import dev.gitlive.firebase.Firebase
import dev.gitlive.firebase.auth.FirebaseAuth
import dev.gitlive.firebase.auth.auth
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource

class AndroidIosAuthDataSource : AuthDataSource {
    private val firebaseAuth: FirebaseAuth = Firebase.auth

    override fun authenticationRequired(): Flow<Boolean> =
        firebaseAuth.authStateChanged.map { user ->
            user == null
        }

    override suspend fun signup(email: String, password: String): Result<Boolean> = runCatching {
        firebaseAuth.createUserWithEmailAndPassword(
            email = email,
            password = password,
        ).user != null
    }

    override suspend fun login(email: String, password: String): Result<Boolean> {
        TODO("Not yet implemented")
    }
}