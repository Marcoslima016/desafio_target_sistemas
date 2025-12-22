import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login.store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

LoginStore get loginStore => ServiceLocator.I.get<LoginStore>();

abstract class LoginStoreBase with Store {
  //
  ///- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ///  ATRIBUTOS
  ///- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  @observable
  ILoginState state = LoginStates.formFill(null);

  late final ExecuteLoginAttempt _executeLoginAttempt;

  late AsyncContext loginPageContext;

  // FORM
  final formKey = GlobalKey<FormState>();
  @observable
  AutovalidateMode formValidateMode = AutovalidateMode.disabled;
  final TextEditingController usernameInput = TextEditingController();
  final TextEditingController passInput = TextEditingController();

  ///- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ///  METODO CONSTRUTOR
  ///- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  LoginStoreBase({
    required ExecuteLoginAttempt executeLoginAttempt,
  }) {
    _executeLoginAttempt = executeLoginAttempt;
    _watchInputsUpdate();
  }

  ///- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ///  HANDLE INPUT UPDATES
  ///- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  /// Escutar atualizações dos inputs.
  void _watchInputsUpdate() {
    usernameInput.addListener(() => _refreshStateAfterInputUpdate());
    passInput.addListener(() => _refreshStateAfterInputUpdate());
  }

  void _refreshStateAfterInputUpdate() async {
    bool validated = true;
    if (usernameInput.text.isEmpty) validated = false;
    if (passInput.text.length < 8) validated = false;
    state = validated ? LoginStates.readyForSubmit(state.lastAttempt) : LoginStates.formFill(state.lastAttempt);
  }

  ///- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ///  HANDLE LOGIN ATTEMPT
  ///- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  void handleEnterButtonTap() async {
    if (_checkIfFormIsValidforSubmitLogin() == false) {
      // TODO: Exibir toast "Você deve preencher todos os dados antes de prosseguir"
    } else {
      late LoginAttemptResult? loginResult;
      try {
        state = LoginStates.submit(state.lastAttempt);

        await _performLoginFlow(
          onFinnaly: (LoginAttemptResult result) async {
            loginResult = result;
          },
        );
      } catch (e) {
        // _handleException();
      } finally {
        if (loginResult != null && loginResult?.authorized == true) {
          state = LoginStates.finished();
        } else {
          state = LoginStates.readyForSubmit(loginResult);
        }
      }
    }
  }

  bool _checkIfFormIsValidforSubmitLogin() {
    try {
      if (formKey.currentState!.validate() == false) {
        formValidateMode = AutovalidateMode.onUserInteraction;
        return false;
      }
      return true;
    } catch (e) {
      // _handleException();
      rethrow;
    }
  }

  Future<void> _performLoginFlow({
    required Function(LoginAttemptResult result) onFinnaly,
  }) async {
    Object? error;
    LoginAttemptResult? attemptResult;
    try {
      await LoadingPopup.show(loginPageContext());

      attemptResult = await _executeLoginAttempt(
        credentials: LoginCredentials(
          username: usernameInput.text,
          pass: passInput.text,
        ),
      );
    } catch (e) {
      error = e;
      attemptResult = LoginAttemptResult.notAuthorized();
    } finally {
      await LoadingPopup.hide();
      if (error != null) _handleException();
      if (attemptResult!.authorized) {
        AppNavigator.I.goToHome(context: loginPageContext());
      }
      await onFinnaly(attemptResult);
    }
  }

  void _handleException() {}
}
