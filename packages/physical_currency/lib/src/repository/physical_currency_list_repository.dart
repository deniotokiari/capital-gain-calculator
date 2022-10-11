import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:physical_currency/src/model/physical_currency.dart';

class PhysicalCurrencyListRepository {
  final LocalStorage _localStorage;
  final AsyncValueGetter<List<PhysicalCurrency>> _remotePhysicalCurrencyListCall;

  final List<PhysicalCurrency> _list = List.empty(growable: true);

  PhysicalCurrencyListRepository(
    this._localStorage,
    this._remotePhysicalCurrencyListCall,
  );

  Future<List<PhysicalCurrency>> getPhysicalCurrencyList() async {
    if (_list.isEmpty) {
      // try to get from local cache
      final localPhysicalCurrencyList = await _localStorage.collection(PhysicalCurrency.fromMap);

      if (localPhysicalCurrencyList.isEmpty) {
        // try to get from remote
        final remotePhysicalCurrencyList = await _remotePhysicalCurrencyListCall();

        if (remotePhysicalCurrencyList.isEmpty) {
          // so no response then return empty list
        } else {
          _list.addAll(remotePhysicalCurrencyList);
        }
      } else {
        _list.addAll(localPhysicalCurrencyList);
      }
    }

    return _list;
  }
}
