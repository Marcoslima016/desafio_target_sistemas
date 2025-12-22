import '../../auth_core.exports.dart';
import '../domain.exports.dart';

abstract class IInitAuthSession {
  Future call({required User user});
}

class InitAuthSession implements IInitAuthSession {
  final IAuthSessionRepository repository;

  const InitAuthSession({
    required this.repository,
  });

  @override
  Future call({required User user}) async {
    try {
      final newSession = AuthSession(user: user);
      await repository.saveSession(
        session: newSession,
      );
    } catch (e) {
      rethrow;
    }
  }
}
