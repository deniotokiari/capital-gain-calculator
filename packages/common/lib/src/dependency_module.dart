import 'package:get_it/get_it.dart';

abstract class DependencyModule {
  final GetIt _getIt = GetIt.I;

  void init();

  T get<T extends Object>() => _getIt.get<T>();

  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc) {
    _getIt.registerFactory(factoryFunc);
  }

  void registerFactoryParam<T extends Object, P1, P2>(
    FactoryFuncParam<T, P1, P2> factoryFunc,
  ) {
    _getIt.registerFactoryParam(factoryFunc);
  }

  void registerSingleton<T extends Object>(T instance) {
    _getIt.registerSingleton(instance);
  }

  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc) {
    _getIt.registerLazySingleton(factoryFunc);
  }
}
