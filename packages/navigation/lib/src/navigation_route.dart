import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class NavigationRoute {
  final RouteDestination route;
  final Map<String, dynamic> arguments;

  NavigationRoute(
    this.route,
    this.arguments,
  );

  void push(BuildContext context) {
    Navigator.pushNamed(
      context,
      route.name,
      arguments: arguments,
    );
  }

  static Map<String, dynamic> _getArguments(Object? arguments, Uri uri) {
    if (arguments != null) {
      return arguments as Map<String, dynamic>;
    } else {
      final query = uri.queryParameters;

      return query;
    }
  }

  static RouteSettings _getSettings(RouteSettings settings, Uri uri) {
    if (settings.arguments != null) {
      final arguments = settings.arguments as Map<String, dynamic>;
      final query = List.empty(growable: true);

      arguments.forEach((key, value) {
        query.add('$key=$value');
      });

      final name = '${uri.path}${query.isEmpty ? '' : '?'}${query.join('&')}';

      return settings.copyWith(name: name);
    } else {
      return settings;
    }
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final name = settings.name;

    if (name != null) {
      Uri uri = Uri.parse(name);

      final builder = runCatching(
        () => uri.path.get<NavigationWidgetBuilder>(
          instanceName: name,
        ),
      ).map(
        success: (success) => success.data,
        failed: (_) => null,
      );

      if (builder != null) {
        return MaterialPageRoute(
          builder: (context) => builder.builder(context, _getArguments(settings.arguments, uri)),
          settings: _getSettings(settings, uri),
        );
      }
    }

    return null;
  }

  factory NavigationRoute.portfolio(String id) => NavigationRoute(
        RouteDestination.portfolio,
        {'id': id},
      );
}

enum RouteDestination {
  root('/'),
  portfolio('/portfolio');

  final String name;

  const RouteDestination(this.name);
}
