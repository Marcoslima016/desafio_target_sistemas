import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStylesTokens {
  TextStylesTokens();

  static const TextStyle _parent = TextStyle(fontFamily: "Poppins");

  //--------------------------- DISPLAY ---------------------------

  final ThemeTextStyle displayExtraLarge = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: const Color.fromARGB(255, 21, 21, 21),
    ),
  );

  final ThemeTextStyle displayLarge = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w900,
      color: const Color.fromARGB(255, 29, 29, 29),
    ),
  );

  final ThemeTextStyle displayMedium = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: const Color.fromARGB(255, 29, 29, 29),
    ),
  );

  final ThemeTextStyle displaySmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: const Color.fromARGB(255, 29, 29, 29),
    ),
  );

  //---------------------------- HEADING ----------------------------

  final ThemeTextStyle headingLarge = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: const Color.fromARGB(255, 29, 29, 29),
    ),
  );

  final ThemeTextStyle headingMedium = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: const Color.fromARGB(255, 29, 29, 29),
    ),
  );

  final ThemeTextStyle headingSmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color.fromARGB(255, 29, 29, 29),
    ),
  );

  final ThemeTextStyle headingExtraSmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: const Color.fromARGB(255, 29, 29, 29),
    ),
  );

  //------------------------------ BODY ------------------------------

  final ThemeTextStyle bodyLarge = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: const Color.fromARGB(255, 21, 21, 21),
    ),
  );

  final ThemeTextStyle bodyMedium = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: const Color.fromARGB(255, 21, 21, 21),
    ),
  );

  final ThemeTextStyle bodyMediumBold = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      height: 1.18,
      color: const Color.fromARGB(255, 21, 21, 21),
    ),
  );

  final ThemeTextStyle bodySmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 13.5,
      fontWeight: FontWeight.w400,
      color: const Color.fromARGB(255, 21, 21, 21),
    ),
  );

  //------------------------------ LABEL ------------------------------

  final ThemeTextStyle labelMedium = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 1.18,
      color: Colors.grey[600],
    ),
  );

  final ThemeTextStyle labelSmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      height: 1.18,
      color: Colors.grey[600],
    ),
  );

  final ThemeTextStyle labelExtraSmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      height: 1.18,
      color: Colors.grey[600],
    ),
  );
}

class ThemeTextStyle extends TextStyle {
  ThemeTextStyle.style(TextStyle style)
      : super(
          inherit: style.inherit,
          color: style.color,
          backgroundColor: style.backgroundColor,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
          fontStyle: style.fontStyle,
          letterSpacing: style.letterSpacing,
          wordSpacing: style.wordSpacing,
          textBaseline: style.textBaseline,
          height: style.height,
          leadingDistribution: style.leadingDistribution,
          locale: style.locale,
          foreground: style.foreground,
          background: style.background,
          shadows: style.shadows,
          fontFeatures: style.fontFeatures,
          decoration: style.decoration,
          decorationColor: style.decorationColor,
          decorationStyle: style.decorationStyle,
          decorationThickness: style.decorationThickness,
          debugLabel: style.debugLabel,
          fontFamily: style.fontFamily,
          fontFamilyFallback: style.fontFamilyFallback,
          overflow: style.overflow,
        );

  @override
  double get fontSize {
    double sizeAdjustedToScreen = super.fontSize!.sp;
    return sizeAdjustedToScreen;
  }
}
