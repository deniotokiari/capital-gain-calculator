import 'package:flutter/material.dart';

mixin AppWidget on Widget {
  Widget buildAppWidget(Widget body) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: body,
      );
}
