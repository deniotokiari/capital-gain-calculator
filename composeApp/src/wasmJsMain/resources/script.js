function externalGetCollection(path) {
  return store.collection(path).get().then((querySnapshot) => {
    var result = querySnapshot.docs.map((doc) => {
      return doc.data()
    })

    return JSON.stringify(result)
  })
}

function externalPutItem(path, data) {
    var json = JSON.parse(data)

    return store
        .doc(path)
        .set(json)
        .then((ref) => {
            return true
        })
}

function externalGetItem(path) {
    return JSON.stringify(store.doc(path).get().data())
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

function getUserUid() {
    var user = firebase.auth().currentUser;

    if (user != null) {
        return user.uid;
    } else {
        return null;
    }
}