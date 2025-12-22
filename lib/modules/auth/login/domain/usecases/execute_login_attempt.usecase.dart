import 'package:desafio_target_sistemas/modules/auth/auth_core/auth_core.exports.dart';
import '../domain.exports.dart';

abstract class IExecuteLoginAttempt {
  Future call({required LoginCredentials credentials});
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
  Future call({
    required LoginCredentials credentials,
  }) async {
    try {
      final authenticationResult = await loginRepository.loginWithEmail(
        credentials: credentials,
      );

      final userDetails = await getUserDetails(
        userId: authenticationResult.id,
      );

      await initAuthSession(
        user: userDetails,
      );
    } catch (e) {
      rethrow;
    }
  }
}
