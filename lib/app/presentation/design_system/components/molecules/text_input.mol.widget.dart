import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MTextInput extends StatelessWidget {
  const MTextInput({
    required this.controller,
    this.hintText,
    this.label,
    this.inputFormatters,
    this.obscure = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    super.key,
    this.validator,
    this.suffixIcon,
  });

  static BorderRadius borderRadius = BorderRadius.circular(10.w);

  final TextEditingController controller;

  final bool obscure;

  final TextCapitalization textCapitalization;

  /// Texto exibido quando não tem valor inserido no input.
  ///
  /// Serve para indicar ao usuário qual informação deve ser inserida no input,
  /// além de poder exibir um exemplo.
  final String? hintText;

  /// Titulo do input
  final String? label;

  final List<TextInputFormatter>? inputFormatters;

  final TextInputType? keyboardType;

  final String? Function(String?)? validator;

  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization,
      controller: controller,
      obscureText: obscure,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(
        color: const Color.fromARGB(255, 58, 58, 58),
        fontWeight: FontWeight.w500,
        fontSize: 17.sp,
      ),
      decoration: InputDecoration(
        fillColor: context.design.colors.surface,
        filled: true,
        hintText: hintText,
        labelText: label,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(
          fontSize: 15.sp,
          color: const Color.fromARGB(255, 176, 176, 176),
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 17.sp,
          color: context.design.colors.primary,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18.sp, horizontal: 10.sp),
        alignLabelWithHint: false,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          color: const Color.fromARGB(255, 156, 156, 156),
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 0.8.sp,
            color: const Color.fromARGB(255, 237, 237, 237),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 1.2.sp,
            color: context.design.colors.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 2.4.sp,
            color: const Color.fromARGB(255, 154, 27, 18),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 2.4.sp,
            color: const Color.fromARGB(255, 154, 27, 18),
          ),
        ),
      ),
    );
  }
}
