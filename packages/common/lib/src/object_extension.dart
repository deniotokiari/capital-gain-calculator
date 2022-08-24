import 'package:get_it/get_it.dart';

extension NonNullObjectExtension<T> on T {
  P get<P extends Object>() => GetIt.I.get<P>();
}

extension NullObjectExtension<T> on T? {
  T get require => this as T;
}
