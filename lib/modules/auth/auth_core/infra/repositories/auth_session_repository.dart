import 'package:desafio_target_sistemas/modules/auth/auth_core/auth_core.exports.dart';

class AuthSessionRepository implements IAuthSessionRepository {
  final IAuthSessionDatasource datasource;

  AuthSessionRepository({
    required this.datasource,
  });

  @override
  Future<void> saveSession({
    required AuthSession session,
  }) async {
    try {
      await datasource.saveSession(
        payload: session.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthSession?> recoverLastSession() {
    // TODO: implement recoverLastSession
    throw UnimplementedError();
  }
}
