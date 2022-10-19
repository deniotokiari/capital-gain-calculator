import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.failed(Error error) = Failed;
}

extension ResultExtension<T> on Result<T> {
  T get requireValue => (this as Success).data;

  Error get requireException => (this as Failed).error;
}

Result<T> runCatching<T>(T Function() action) {
  try {
    return Result.success(action());
  } catch (e) {
    return Result.failed(e as Error);
  }
}

Future<Result<T>> runCatchingAsync<T>(Future<T> Function() action) async {
  try {
    return Result.success(await action());
  } catch (e) {
    return Result.failed(e as Error);
  }
}

extension FutureExtension<T> on Future<T> {
  Future<Result<T>> runCatching() async {
    try {
      return Result.success(await this);
    } catch (e) {
      return Result.failed(e as Error);
    }
  }
}
