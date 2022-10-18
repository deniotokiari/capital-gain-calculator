import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_result.freezed.dart';

@freezed
class NavigationResult with _$NavigationResult {
  const factory NavigationResult.ok({dynamic data}) = NavigationResultOk;

  const factory NavigationResult.cancel() = NavigationResultCancel;
}
