package pl.deniotokiari.core.misc

import com.russhwolf.settings.Settings

class LocalStore {
    private val settings = Settings()

    fun putString(key: String, value: String) = settings.putString(key, value)

    fun getString(key: String): String? = settings.getStringOrNull(key)
}