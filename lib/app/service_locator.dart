import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:desafio_target_sistemas/modules/auth/auth_core/external/datasources/auth_session.datasource.dart';
import 'package:desafio_target_sistemas/modules/auth/auth_core/infra/repositories/auth_session_repository.dart';
import 'package:desafio_target_sistemas/modules/auth/login/external/datasources/login_mock.datasource.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  final _getIt = GetIt.instance;

  static final ServiceLocator I = ServiceLocator._();
  ServiceLocator._();

  T get<T extends Object>() => _getIt.get<T>();

  void setupDependencies() {
    //
    // ###### core #####

    _getIt.registerFactory<ILocalStorageDriver>(() => SharedPreferencesDriver());

    //
    // ###### APP ######

    _getIt.registerLazySingleton<DesignSystem>(() => DesignSystem());
    _getIt.registerLazySingleton<AppNavigator>(() => AppNavigator(adapter: NativeNavigator()));

    //
    // ###### AUTH ######

    // AUTH_CORE
    _getIt.registerFactory<IAuthSessionDatasource>(
      () => AuthSessionDatasource(driver: _getIt.get<ILocalStorageDriver>()),
    );
    _getIt.registerLazySingleton<IAuthSessionRepository>(
      () => AuthSessionRepository(datasource: _getIt.get<IAuthSessionDatasource>()),
    );
    _getIt.registerFactory<IInitAuthSession>(
      () => InitAuthSession(repository: _getIt.get<IAuthSessionRepository>()),
    );

    // LOGIN
    _getIt.registerFactory<ILoginDatasource>(
      () => LoginMockDatasource(),
    );
    _getIt.registerLazySingleton<ILoginRepository>(
      () => LoginRepository(datasource: _getIt.get<ILoginDatasource>()),
    );
    _getIt.registerFactory<IGetUserDetails>(
      () => GetUserDetails(loginRepository: _getIt.get<ILoginRepository>()),
    );
    _getIt.registerFactory<IExecuteLoginAttempt>(
      () => ExecuteLoginAttempt(
        loginRepository: _getIt.get<ILoginRepository>(),
        getUserDetails: _getIt.get<IGetUserDetails>(),
        initAuthSession: _getIt.get<IInitAuthSession>(),
      ),
    );
    _getIt.registerSingleton<LoginStore>(LoginStore());
  }
}
