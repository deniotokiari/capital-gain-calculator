import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sign_up/sign_up.dart';

part 'app_navigation.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignUpPage, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
