import 'package:desafio_target_sistemas/modules/auth/auth_core/auth_core.exports.dart';
import '../domain.exports.dart';

abstract class ILoginRepository {
  Future<LoginAttemptResult> loginWithEmail({
    required LoginCredentials credentials,
  });

  Future<User> getUserDetails({
    required String userId,
  });
}
