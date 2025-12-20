import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  final _getIt = GetIt.instance;

  static final ServiceLocator I = ServiceLocator._internal();
  ServiceLocator._internal();

  T get<T extends Object>() => _getIt.get<T>();

  void setupDependencies() {
    _getIt.registerLazySingleton<DesignSystem>(() => DesignSystem());
  }
}
