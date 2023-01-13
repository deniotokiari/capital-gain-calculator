import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireStoreSource {
  final _db = FirebaseFirestore.instance;

  Future<void> add({
    required String name,
    required String id,
    required Map<String, dynamic> value,
  }) async {
    await _db.collection(name).doc(id).set(value);
  }

  Future<Map<String, dynamic>?> get({
    required String name,
    required String id,
  }) async {
    return await _db.collection(name).doc(id).get().then((value) => value.data());
  }
}
