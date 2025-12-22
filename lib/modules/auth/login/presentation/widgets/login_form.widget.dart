import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Form(
          key: loginStore.formKey,
          autovalidateMode: loginStore.formValidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60.sp),

              //CAMPOS DO FORMULARIO
              _buildInputsColumn(),

              SizedBox(height: 30.sp),

              //BOTÃO 'ENTRAR'
              _buildEnterButton(),

              SizedBox(height: 65.sp),
            ],
          ),
        );
      },
    );
  }

  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //  FORM INPUTS COLUMN
  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  Widget _buildInputsColumn() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 14.sp,
        children: [
          //

          // INPUT USUARIO
          //
          _buildInput(
            label: "Usuário",
            controller: loginStore.usernameInput,
            validator: (p0) {
              if ((p0 != null && p0.isEmpty) || p0 == null) {
                return "Por favor, informe o usuário.";
              } else {
                return null;
              }
            },
          ),

          // INPUT SENHA
          //
          _buildInput(
            label: "Senha",
            controller: loginStore.passInput,
            obscure: true,
            validator: (p0) {
              if ((p0 != null && p0.isEmpty) || p0 == null) {
                return "Por favor, informe a senha.";
              } else {
                return null;
              }
            },
          ),

          //
        ],
      ),
    );
  }

  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //  INPUT BUILDER
  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  Widget _buildInput({
    required String label,
    required TextEditingController controller,
    bool obscure = false,
    required String? Function(String?)? validator,
  }) {
    return MTextInput(
      label: label,
      controller: controller,
      obscure: obscure,
      validator: validator,
    );
  }

  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //  BOTÃO "ENTRAR"
  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  Widget _buildEnterButton() {
    return ABoxButton.fill(
      kind: ButtonKind.primary,
      text: "Entrar",
      active: loginStore.state is ReadyForSubmitState,
      enableTapOnlyIfActive: false,
      onTap: () async {
        bool submitInProgress = loginStore.state is SubmitState;
        bool finished = loginStore.state is FinishedState;
        if (submitInProgress == false && finished == false) {
          loginStore.handleEnterButtonTap();
        }
      },
    );
  }
}
