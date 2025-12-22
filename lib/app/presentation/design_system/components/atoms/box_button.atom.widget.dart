import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType {
  fill,
  cancel,
  outline,
}

enum ButtonKind {
  primary,
  secondary,
}

class ABoxButton extends StatelessWidget {
  final Future Function() onClick;

  final String text;

  final bool active;

  late final ButtonType buttonType;

  final ButtonKind kind;

  ABoxButton.fill({
    super.key,
    required this.onClick,
    required this.text,
    this.active = true,
    required this.kind,
  }) {
    buttonType = ButtonType.fill;
  }

  ABoxButton.outline({
    super.key,
    required this.onClick,
    required this.text,
    this.active = true,
    required this.kind,
  }) {
    buttonType = ButtonType.outline;
  }

  Color _generateBackgroundColor(BuildContext context) {
    if (buttonType == ButtonType.outline) {
      return Colors.transparent;
    } else if (buttonType == ButtonType.fill) {
      if (active) {
        return context.design.colors.primary;
      } else {
        return Colors.grey[300]!;
      }
    }
    return Colors.transparent;
  }

  Color _generateTextColor(BuildContext context) {
    if (buttonType == ButtonType.outline) {
      if (active) {
        return context.design.colors.primary;
      } else {
        return Colors.grey[300]!;
      }
    } else if (buttonType == ButtonType.fill) {
      if (active) {
        return Colors.white;
      } else {
        return const Color.fromARGB(255, 138, 138, 138);
      }
    } else {
      return Colors.white;
    }
  }

  WidgetStateProperty<BorderSide?>? _generateBorder(BuildContext context) {
    if (buttonType == ButtonType.outline) {
      return WidgetStateProperty.all<BorderSide>(
        BorderSide(
          color: active ? context.design.colors.primary : Colors.grey[300]!,
          width: 0.8.sp,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(
            EdgeInsets.only(top: 14.sp, bottom: 14.sp),
          ),
          backgroundColor: WidgetStateProperty.all(_generateBackgroundColor(context)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.h),
            ),
          ),
          side: _generateBorder(context),
        ),
        onPressed: active ? onClick : () {},
        child: Text(
          text,
          style: TextStyle(
            color: _generateTextColor(context),
            fontSize: 15.sp,
            fontFamily: "Figtree",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
