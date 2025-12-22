abstract class IAuthSessionDatasource {
  Future<void> saveSession({required Map<String, dynamic> payload});
}
