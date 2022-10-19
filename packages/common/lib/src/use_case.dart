import 'package:common/src/result.dart';

abstract class UseCase<P, T> {
  Future<Result<T>> execute(P args);
}
