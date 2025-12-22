// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../domain.exports.dart';

class AuthSession {
  final User user;

  AuthSession({
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
    };
  }

  factory AuthSession.fromMap(Map<String, dynamic> map) {
    return AuthSession(
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthSession.fromJson(String source) => AuthSession.fromMap(json.decode(source) as Map<String, dynamic>);
}
