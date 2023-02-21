import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState.loading() = _SplashStateLoading;

  factory SplashState.done() = _SplashStateDone;
}
