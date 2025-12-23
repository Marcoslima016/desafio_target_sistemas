import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MEditableText extends StatelessWidget {
  final TextEditingController controller;

  final bool editing;

  static BorderRadius borderRadius = BorderRadius.circular(5.sp);

  final TextCapitalization textCapitalization;

  final String? hintText;

  final String? label;

  final TextInputType? keyboardType;

  final String? Function(String?)? validator;

  final Widget? suffixIcon;
  const MEditableText({
    required this.controller,
    this.hintText,
    this.label,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    super.key,
    this.validator,
    this.suffixIcon,
    this.editing = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.sp,
      child: IgnorePointer(
        ignoring: !editing,
        child: TextFormField(
          readOnly: !editing,
          textCapitalization: textCapitalization,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
            color: editing ? const Color.fromARGB(255, 10, 10, 10) : const Color.fromARGB(255, 141, 141, 141),
            fontWeight: editing ? FontWeight.w600 : FontWeight.w500,
            // fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            fillColor: editing ? context.design.colors.containerTertiary : Colors.transparent,
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
              fontSize: 14.sp,
              color: context.design.colors.primary,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 10.sp),
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 156, 156, 156),
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: editing
                ? OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                      width: 0.6.sp,
                      color: const Color.fromARGB(255, 193, 193, 193),
                    ),
                  )
                : InputBorder.none,
            // enabledBorder: InputBorder.none,
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: borderRadius,
            //   borderSide: BorderSide(
            //     width: 1.2.sp,
            //     color: context.design.colors.primary,
            //   ),
            // ),
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
        ),
      ),
    );
  }
}
