import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:physical_currency/physical_currency.dart';

class PhysicalCurrencyValueWidget extends Text {
  PhysicalCurrencyValueWidget({
    required PhysicalCurrencyValue currency,
    TextAlign? textAlign,
    TextStyle? style,
    Key? key,
  }) : super(
          currency.gainOrLoss,
          style: (style ?? const TextStyle(inherit: true)).copyWith(
            color: currency.value < 0 ? Colors.red : Colors.green,
          ),
          textAlign: textAlign,
          key: key,
        );
}

class PercentValueWidget extends Text {
  PercentValueWidget({
    required PercentValue value,
    TextAlign? textAlign,
    TextStyle? style,
    Key? key,
  }) : super(
          value.formatted,
          style: (style ?? const TextStyle(inherit: true)).copyWith(
            color: value.value < 0 ? Colors.red : Colors.green,
          ),
          textAlign: textAlign,
          key: key,
        );
}
