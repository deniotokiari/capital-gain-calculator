library store;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:store/repository/prefs_repository.dart';
import 'package:store/source/cloud_firestore_db_source.dart';
import 'package:store/source/cloud_firestore_prefs_source.dart';
import 'package:utility/utility.dart';

export 'repository/prefs_repository.dart';
export 'common/query.dart';
export 'common/space.dart';
export 'model/db_entity.dart';
export 'repository/db_repository.dart';

class StoreModule extends DependencyModule {
  final ValueGetter<String?> _userId;

  StoreModule(this._userId);

  @override
  Future<void> init() async {
    if (kDebugMode) {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    }

    registerLazySingleton(() => PrefsRepository(CloudFirestorePrefsSource(_userId)));
    registerLazySingleton(() => CloudFirestoreDbSource(_userId));
  }
}
