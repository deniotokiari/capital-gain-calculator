import 'package:flutter/material.dart';

class NavigationWidgetBuilder {
  final Widget Function(BuildContext, Map<String, dynamic> args) builder;

  NavigationWidgetBuilder(this.builder);
}
