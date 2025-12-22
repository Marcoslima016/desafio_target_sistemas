abstract class ILoginDatasource {
  Future<Map<String, dynamic>> loginWithEmail({required Map<String, dynamic> payload});
  Future<Map<String, dynamic>> getUserDetails({required Map<String, dynamic> payload});
}
