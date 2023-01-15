library cloud_store;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_store/source/cloud_prefs_source.dart';
import 'package:utility/utility.dart';

class CloudStoreModule extends DependencyModule {
  @override
  Future<void> init() async {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

    registerLazySingleton(() => CloudPrefsStoreSource());
  }
}
