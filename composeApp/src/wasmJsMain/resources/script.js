function getCollection(path) {
  return store.collection(path).get().then((querySnapshot) => {
    var result = querySnapshot.docs.map((doc) => {
      return doc.data()
    })

    return JSON.stringify(result)
  })
}

function putItem(path, data) {
    var json = JSON.parse(data)

    return store
        .collection(path)
        .add(json)
        .then((ref) => {
            return true
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
        });
}

function signInWithEmailAndPassword(email, password) {
    return auth.signInWithEmailAndPassword(email, password)
        .then((userCredential) => {
            var user = userCredential.user;

            if (user) {
                return true
            } else {
                return false
            }
        });
}