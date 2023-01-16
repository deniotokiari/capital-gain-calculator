import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CloudFirestorePrefsSource {
  final _db = FirebaseFirestore.instance;
  final ValueGetter<String> _userId;

  CloudFirestorePrefsSource(this._userId);

  Future<void> add({
    required String name,
    required Map<String, dynamic> value,
  }) async {
    await _db.collection('user_data').doc('prefs').collection(_userId()).doc(name).set(value);
  }

  Future<Map<String, dynamic>?> get({
    required String name,
  }) async {
    return await _db
        .collection('user_data')
        .doc('prefs')
        .collection(_userId())
        .doc(name)
        .get()
        .then((value) => value.data());
  }
}
