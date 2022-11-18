import 'package:common/common.dart';
import 'package:physical_currency/physical_currency.dart';

class ConvertPhysicalCurrencyUseCaseUseCase
    implements
        UseCase<ConvertPhysicalCurrencyUseCaseArguments,
            Future<ConvertPhysicalCurrencyUseCaseResult>> {
  @override
  Future<ConvertPhysicalCurrencyUseCaseResult> execute(
      ConvertPhysicalCurrencyUseCaseArguments args) async {
    return ConvertPhysicalCurrencyUseCaseResult(args.from);
  }
}

class ConvertPhysicalCurrencyUseCaseArguments {
  final PhysicalCurrencyValue from;
  final PhysicalCurrency to;

  ConvertPhysicalCurrencyUseCaseArguments({
    required this.from,
    required this.to,
  });
}

class ConvertPhysicalCurrencyUseCaseResult {
  final PhysicalCurrencyValue value;

  ConvertPhysicalCurrencyUseCaseResult(this.value);
}
