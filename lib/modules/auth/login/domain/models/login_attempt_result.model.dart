class LoginAttemptResult {
  late final bool authorized;
  late final String? userId;
  late final String? loginFailMessage;

  LoginAttemptResult.authorized({
    required this.userId,
  }) {
    loginFailMessage = null;
    authorized = true;
  }

  LoginAttemptResult.notAuthorized({
    this.loginFailMessage,
  }) {
    userId = null;
    authorized = false;
  }
}
