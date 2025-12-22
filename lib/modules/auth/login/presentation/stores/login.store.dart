import 'dart:developer';

import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../login.exports.dart';

part 'login.store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

LoginStore get loginStore => ServiceLocator.I.get<LoginStore>();

abstract class LoginStoreBase with Store {
  late final ExecuteLoginAttempt executeLoginAttempt;

  late BuildContext loginPageContext;

  final TextEditingController userNameInput = TextEditingController();

  final TextEditingController passInput = TextEditingController();

  @observable
  LoginStates state = LoginStates.fill;

  LoginStoreBase() {
    executeLoginAttempt = ServiceLocator.I.get<ExecuteLoginAttempt>();
  }

  void onTapLogin() async {
    bool loginFail = false;

    //TODO: EXIBIR LOADING

    try {
      await executeLoginAttempt(
        credentials: LoginCredentials(
          username: userNameInput.text,
          pass: passInput.text,
        ),
      );
    } catch (e) {
      loginFail = true;
    } finally {
      //
      //TODO: FECHAR LOADING

      if (loginFail) {
        //
      } else {
        if (loginPageContext.mounted) AppNavigator.I.goToHome(context: loginPageContext);
      }
    }
  }
}
