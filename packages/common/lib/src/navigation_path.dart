import 'package:common/common.dart';
import 'package:flutter/material.dart';

class NavigationPath {
  final Widget Function(BuildContext, Map<String, dynamic>? args) builder;

  NavigationPath(this.builder);

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    final name = settings.name;

    if (name != null) {
      final uri = Uri.parse(name);
      final path = runCatching(() => name.get<NavigationPath>(instanceName: uri.path)).mapOrNull(
        success: (success) => success.data,
      );

      if (path != null) {
        final arguments = settings.arguments as Map<String, dynamic>?;
        final query = <String>[];

        arguments?.forEach((key, value) {
          query.add('$key=$value');
        });

        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, arguments),
          settings: settings.copyWith(
              name: '${uri.path}${query.isEmpty ? '' : '?'}${query.join('&')}', arguments: null),
        );
      }
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }
}
