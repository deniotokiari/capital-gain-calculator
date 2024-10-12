const module = await window["composeApp"]

auth.onAuthStateChanged((user) => {
    if (user) {
        module.updateAuthState(true)
    } else {
        module.updateAuthState(false)
    }
});