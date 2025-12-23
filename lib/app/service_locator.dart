import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  final _getIt = GetIt.instance;

  static final ServiceLocator I = ServiceLocator._();
  ServiceLocator._();

  T get<T extends Object>() => _getIt.get<T>();

  void setupDependencies() {
    _getIt.registerLazySingleton<DesignSystem>(() => DesignSystem());
    _getIt.registerLazySingleton<AppNavigator>(() => AppNavigator(adapter: NativeNavigator()));

    // - - - - - - - - - - - - - - - - - - -
    // INFORMATION_RECORD

    _getIt.registerSingleton<ManageRecordsStore>(ManageRecordsStore());
  }
}
