import 'package:flutter/material.dart';

class NavigationPath {
  final String pattern;
  final Widget Function(BuildContext, String?) builder;

  NavigationPath(this.pattern, this.builder);

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
    List<NavigationPath> paths,
  ) {
    final name = settings.name;

    if (name != null) {
      for (NavigationPath path in paths) {
        final regExpPattern = RegExp(path.pattern);

        if (regExpPattern.hasMatch(name)) {
          final firstMatch = regExpPattern.firstMatch(name);
          final match = (firstMatch?.groupCount == 1) ? firstMatch?.group(1) : null;

          return MaterialPageRoute<void>(
            builder: (context) => path.builder(context, match),
            settings: settings,
          );
        }
      }
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }
}
