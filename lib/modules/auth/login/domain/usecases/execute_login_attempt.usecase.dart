import 'package:desafio_target_sistemas/modules/auth/auth_core/auth_core.exports.dart';
import '../domain.exports.dart';

abstract class IExecuteLoginAttempt {
  Future<LoginAttemptResult> call({required LoginCredentials credentials});
}

class ExecuteLoginAttempt implements IExecuteLoginAttempt {
  final ILoginRepository loginRepository;
  final IGetUserDetails getUserDetails;
  final IInitAuthSession initAuthSession;

  ExecuteLoginAttempt({
    required this.loginRepository,
    required this.getUserDetails,
    required this.initAuthSession,
  });

  @override
  Future<LoginAttemptResult> call({
    required LoginCredentials credentials,
  }) async {
    try {
      final loginResult = await loginRepository.loginWithEmail(
        credentials: credentials,
      );

      if (loginResult.authorized == true) {
        final loggedUser = await getUserDetails(
          userId: loginResult.userId!,
        );

        await initAuthSession(user: loggedUser);
      }

      return loginResult;
    } catch (e) {
      rethrow;
    }
  }
}
