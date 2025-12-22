import '../domain.exports.dart';

abstract class IAuthSessionRepository {
  Future<void> saveSession({required AuthSession session});
  Future<AuthSession?> recoverLastSession();
}
