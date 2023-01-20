// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_navigation.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SignUpRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SignUpRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/',
        );

  static const String name = 'SignUpRoute';
}
