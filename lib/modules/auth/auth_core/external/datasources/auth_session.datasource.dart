import 'dart:convert';

import 'package:desafio_target_sistemas/lib.exports.dart';

class AuthSessionDatasource implements IAuthSessionDatasource {
  final ILocalStorageDriver driver;

  final String _storageKey = "auth-session";

  const AuthSessionDatasource({
    required this.driver,
  });

  @override
  Future<void> saveSession({
    required Map<String, dynamic> payload,
  }) async {
    try {
      await driver.put(
        key: _storageKey,
        value: json.encode(payload),
      );
    } catch (e) {
      rethrow;
    }
  }
}
