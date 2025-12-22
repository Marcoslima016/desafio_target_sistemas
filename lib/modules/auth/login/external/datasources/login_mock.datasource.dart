import '../../login.exports.dart';

class LoginMockDatasource implements ILoginDatasource {
  const LoginMockDatasource();

  @override
  Future<Map<String, dynamic>> loginWithEmail({
    required Map<String, dynamic> payload,
  }) async {
    final fakeUsername = "marcosvr.lima96@gmail.com";
    final fakePass = "12345678";
    if (payload["user"] == fakeUsername && payload["pass"] == fakePass) {
      return {
        "authorized": true,
        "result": {
          "userId": "cde653d3-486f-4b35-bab6-d37225db20f8",
        }
      };
    } else {
      return {
        "authorized": false,
        "result": {
          "failMessage": "Usuário ou senha inválidos.",
        }
      };
    }
  }

  @override
  Future<Map<String, dynamic>> getUserDetails({
    required Map<String, dynamic> payload,
  }) async {
    return {
      "user": {
        "id": "cde653d3-486f-4b35-bab6-d37225db20f8",
        "name": "Marcos Lima",
        "username": "marcosvr.lima96@gmail.com",
      }
    };
  }
}
