import 'package:desafio_target_sistemas/modules/auth/auth_core/domain/models/user.model.dart';

import '../../login.exports.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource datasource;

  LoginRepository({
    required this.datasource,
  });

  @override
  Future<LoginAttemptResult> loginWithEmail({
    required LoginCredentials credentials,
  }) async {
    try {
      Map<String, dynamic> payload = {
        "user": credentials.username,
        "pass": credentials.pass,
      };

      Map<String, dynamic> datasourceResponse = await datasource.loginWithEmail(
        payload: payload,
      );

      if (datasourceResponse["authorized"] == true) {
        return LoginAttemptResult.authorized(
          userId: datasourceResponse["result"]["userId"],
        );
      } else {
        return LoginAttemptResult.notAuthorized(
          loginFailMessage: datasourceResponse["result"]["failMessage"],
        );
      }
    } catch (e) {
      // TODO: TRATAR EXCESSAO
      rethrow;
    }
  }

  @override
  Future<User> getUserDetails({required String userId}) async {
    try {
      Map<String, dynamic> payload = {
        "userId": userId,
      };

      Map<String, dynamic> result = await datasource.loginWithEmail(
        payload: payload,
      );

      return User(
        id: userId,
        name: result["user"]["name"],
        username: result["user"]["username"],
      );
    } catch (e) {
      // TODO: TRATAR EXCESSAO
      rethrow;
    }
  }
}
