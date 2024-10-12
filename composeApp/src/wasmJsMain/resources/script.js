function collection(path) {
  return store.collection(path).get().then((querySnapshot) => {
    var result = querySnapshot.docs.map((doc) => {
      return doc.data()
    })

    return JSON.stringify(result)
  })
}

function createUserWithEmailAndPassword(email, password) {
    return auth.createUserWithEmailAndPassword(email, password)
        .then((userCredential) => {
            var user = userCredential.user;

            if (user) {
                return true
            } else {
                return false
            }
        })
        .catch((error) => {
            return false
        });
}