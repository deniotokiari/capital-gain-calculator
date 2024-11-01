package pl.deniotokiari.capital.gain.calculator.feature.auth.data

import dev.gitlive.firebase.Firebase
import dev.gitlive.firebase.auth.FirebaseAuth
import dev.gitlive.firebase.auth.auth
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map

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

    override suspend fun login(email: String, password: String): Result<Boolean> = runCatching {
        firebaseAuth.signInWithEmailAndPassword(
            email = email,
            password = password,
        ).user != null
    }

    override suspend fun getUserId(): Result<String> = runCatching {
        firebaseAuth.currentUser?.uid ?: error("User is not authenticated")
    }
}
