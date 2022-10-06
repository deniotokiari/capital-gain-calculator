import 'package:localstore/localstore.dart';

class LocalStorage {
  final _db = Localstore.instance;

  Future<void> save(
    Map<String, dynamic> data, {
    required String name,
    required String id,
  }) {
    return _db.collection(name).doc(id).set(data, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>?> get(String name, String id) {
    return _db.collection(name).doc(id).get();
  }

  Future<List<Map<String, dynamic>>?> collection(String name) {
    return _db.collection(name).get().then(
          (value) => value?.entries
              .map<Map<String, dynamic>>(
                (e) => e.value,
              )
              .toList(growable: false),
        );
  }
}
