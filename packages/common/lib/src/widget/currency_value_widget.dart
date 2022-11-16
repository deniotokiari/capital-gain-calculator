import 'package:flutter/material.dart';

class CurrencyValueWidget extends Text {
  CurrencyValueWidget({
    required double value,
    required String currency,
    required bool percent,
    TextAlign? textAlign,
    TextStyle? style,
    Key? key,
  }) : super(
          '${value < 0 ? '-' : '+'}$currency${(percent ? (value * 100) : value).abs().toStringAsFixed(2)}${percent ? '%' : ''}',
          style: (style ?? const TextStyle(inherit: true)).copyWith(
            color: value < 0 ? Colors.red : Colors.green,
          ),
          textAlign: textAlign,
          key: key,
        );
}
