import 'package:get_it/get_it.dart';

extension NonNullObjectExtension<T> on T {
  P get<P extends Object>({
    dynamic param1,
    dynamic param2,
  }) =>
      GetIt.I.get<P>(param1: param1, param2: param2);
}

extension NullObjectExtension<T> on T? {
  T get require => this as T;
}
