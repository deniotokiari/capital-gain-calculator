package pl.deniotokiar.capital.gain.calculator

import dev.gitlive.firebase.Firebase
import dev.gitlive.firebase.firestore.firestore
import pl.deniotokiar.capital.gain.calculator.presentation.User

class IOSPlatform : Platform {
    override suspend fun getUsers(): List<User> = Firebase
        .firestore
        .collection("USERS")
        .get()
        .documents
        .map { document ->
            document.data<User>()
        } + User("IOS", 10)
}

actual fun getPlatform(): Platform = IOSPlatform()