import 'package:cloud_firestore/cloud_firestore.dart';

class CloudPrefsStoreSource {
  final _db = FirebaseFirestore.instance;

  Future<void> add({
    required String userId,
    required String name,
    required Map<String, dynamic> value,
  }) async {
    await _db.collection('user_data').doc('prefs').collection(userId).doc(name).set(value);
  }

  Future<Map<String, dynamic>?> get({
    required String userId,
    required String name,
  }) async {
    return await _db
        .collection('user_data')
        .doc('prefs')
        .collection(userId)
        .doc(name)
        .get()
        .then((value) => value.data());
  }
}
