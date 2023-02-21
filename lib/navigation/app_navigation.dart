import 'package:auto_route/auto_route.dart';
import 'package:capital_gain_calculator/navigation/auth_guard.dart';
import 'package:feature_home/home.dart';
import 'package:feature_sign_in/sign_in.dart';
import 'package:feature_sign_up/sign_up.dart';
import 'package:feature_splash/splash.dart';
import 'package:flutter/material.dart';

part 'app_navigation.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: SplashPage, initial: true, guards: [AuthGuard]),
    AutoRoute(path: '/sign-in', page: SignInPage),
    AutoRoute(path: '/sign-up', page: SignUpPage),
    AutoRoute(path: '/home', page: HomePage, guards: [AuthGuard]),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}
