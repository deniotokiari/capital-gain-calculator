import 'package:get_it/get_it.dart';

abstract class DependencyModule {
  final GetIt _getIt = GetIt.I;

  Future<void> init();

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

extension Dependency on Object {
  P get<P extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      GetIt.I.get<P>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );

  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    GetIt.I.registerFactory(
      factoryFunc,
      instanceName: instanceName,
    );
  }
}
