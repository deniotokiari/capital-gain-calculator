import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_position_state.freezed.dart';

@freezed
class AddPositionState with _$AddPositionState {
  factory AddPositionState.idle({
    required String? price,
    required String? currency,
    required String? count,
    required DateTime date,
    required List<String> currencyList,
    required bool submitEnabled,
  }) = AddPositionStateIdle;
}
