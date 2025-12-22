import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    loginStore.loginPageContext.value = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      backgroundColor: context.design.colors.background,
    );
  }

  Widget _buildBody() {
    return Container(
      width: 1.sw,
      height: 1.sh,
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
