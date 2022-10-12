import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:physical_currency/src/model/physical_currency.dart';

class PhysicalCurrencyListRepository {
  final LocalStorage _localStorage;
  final AsyncValueGetter<List<PhysicalCurrency>> _remotePhysicalCurrencyListCall;

  PhysicalCurrencyListRepository(
    this._localStorage,
    this._remotePhysicalCurrencyListCall,
  );

  Future<List<PhysicalCurrency>> getPhysicalCurrencyList() async {
    // try to get from local cache
    final localPhysicalCurrencyList = await _localStorage.collection(PhysicalCurrency.fromMap);

    if (localPhysicalCurrencyList.isEmpty) {
      // try to get from remote
      final remotePhysicalCurrencyList = await _remotePhysicalCurrencyListCall();

      if (remotePhysicalCurrencyList.isEmpty) {
        return [];
      } else {
        await _localStorage.saveAll(remotePhysicalCurrencyList);

        return remotePhysicalCurrencyList;
      }
    } else {
      return localPhysicalCurrencyList;
    }
  }
}
