import 'package:auto_route/auto_route.dart';
import 'package:capital_gain_calculator/navigation/auth_guard.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_up/sign_up.dart';
import 'package:splash/splash.dart';

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
