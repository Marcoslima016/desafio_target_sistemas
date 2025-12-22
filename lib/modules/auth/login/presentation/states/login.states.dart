import '../../login.exports.dart';

class LoginStates {
  static FormFillState formFill(LoginAttemptResult? lastAttempt) => FormFillState(lastAttempt);
  static ReadyForSubmitState readyForSubmit(LoginAttemptResult? lastAttempt) => ReadyForSubmitState(lastAttempt);
  static SubmitState submit(LoginAttemptResult? lastAttempt) => SubmitState(lastAttempt);
  static FinishedState finished() => FinishedState();
}

abstract class ILoginState {
  final LoginAttemptResult? lastAttempt;
  const ILoginState(this.lastAttempt);
}

class FormFillState extends ILoginState {
  const FormFillState(super.lastAttempt);
}

class ReadyForSubmitState extends ILoginState {
  const ReadyForSubmitState(super.lastAttempt);
}

class SubmitState extends ILoginState {
  const SubmitState(super.lastAttempt);
}

class FinishedState extends ILoginState {
  const FinishedState() : super(null);
}
