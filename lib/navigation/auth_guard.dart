import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AuthGuard extends AutoRouteGuard {
  final ValueGetter<String?> _userId;

  AuthGuard(this._userId);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_userId() == null) {
      router.popUntil((_) => false);
      router.pushNamed('/sign-in');
    } else {
      resolver.next();
    }
  }
}
