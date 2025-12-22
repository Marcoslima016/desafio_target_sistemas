import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'storage.exports.dart';

class SharedPreferencesDriver implements ILocalStorageDriver {
  //
  // . . . . . . . . . . . . . . . . . VALOR . . . . . . . . . . . . . . . . . .
  //
  // Metodos para manipular valor único (bool, String, int ou double).
  //

  @override
  Future delete({required String key}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  @override
  Future getData({required String key}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future put({required String key, dynamic value}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (value is bool) {
      shared.setBool(key, value);
    } else if (value is String) {
      shared.setString(key, value);
    } else if (value is int) {
      shared.setInt(key, value);
    } else if (value is double) {
      shared.setDouble(key, value);
    }
  }

  // . . . . . . . . . . . . . . . . . Lista . . . . . . . . . . . . . . . . . .
  //
  // Metodos para manipular lista de valores.
  //

  /// ### RECUPERAR LISTA ARMAZENADA
  @override
  Future<List<Map<String, dynamic>>> getList({required String key}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? data = shared.get(key) as String?;

    if (data == null) return [];

    if (data != "") {
      try {
        List decoded = jsonDecode(data);
        if (decoded.first is String) {
          List<Map<String, dynamic>> result = decoded.map((x) {
            return json.decode(x) as Map<String, dynamic>;
          }).toList();
          return result;
        } else if (decoded.first is Map) {
          List<Map<String, dynamic>> result = decoded.map((x) {
            return x as Map<String, dynamic>;
          }).toList();
          return result;
        } else {
          return [];
        }
      } catch (e) {
        return [];
      }
    }

    return [];
  }

  /// ### SALVAR LISTA
  @override
  Future putList({required String key, required List list}) async {
    var shared = await SharedPreferences.getInstance();
    await shared.setString(key, jsonEncode(list));
  }
}
