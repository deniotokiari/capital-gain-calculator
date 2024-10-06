function collection(path) {
  return store.collection(path).get().then((querySnapshot) => {
    var result = querySnapshot.docs.map((doc) => {
      return doc.data()
    })

    return JSON.stringify(result)
  })
}
