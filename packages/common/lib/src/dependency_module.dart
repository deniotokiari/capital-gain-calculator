import 'package:get_it/get_it.dart';

abstract class DependencyModule {
  final GetIt _getIt = GetIt.I;

  void init();

  T get<T extends Object>({
    String? instanceName,
  }) =>
      _getIt.get<T>(instanceName: instanceName);

  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactory(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  void registerFactoryParam<T extends Object, P1, P2>(
    FactoryFuncParam<T, P1, P2> factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactoryParam(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  void registerSingleton<T extends Object>(T instance) {
    _getIt.registerSingleton(instance);
  }

  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerLazySingleton(
      factoryFunc,
      instanceName: instanceName,
    );
  }
}
