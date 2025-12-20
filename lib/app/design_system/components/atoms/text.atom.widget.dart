import 'package:flutter/material.dart';
import '../../design_system.exports.dart';

class AText extends StatelessWidget {
  final ThemeTextStyle? style;
  final String data;
  final TextAlign? align;
  final TextStyle? variation;

  final bool overflowClip;

  AText.displaySmall(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.displaySmall;

  AText.displayMedium(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.displayMedium;

  AText.displayLarge(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.displayLarge;

  AText.displayExtraLarge(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.displayExtraLarge;

  AText.headingSmall(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.headingSmall;

  AText.headingExtraSmall(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.headingExtraSmall;

  AText.headingMedium(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.headingMedium;

  AText.headingLarge(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.headingLarge;

  AText.bodyMedium(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.bodyMedium;

  AText.bodyLarge(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.bodyLarge;

  AText.bodySmall(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.bodySmall;

  AText.bodyMediumBold(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.bodyMediumBold;

  AText.labelMedium(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.labelMedium;

  AText.labelSmall(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.labelSmall;

  AText.labelExtraSmall(
    this.data, {
    super.key,
    this.variation,
    this.align,
    this.overflowClip = false,
  }) : style = DesignSystem.I.textStyles.labelExtraSmall;

  @override
  Widget build(BuildContext context) {
    TextStyle finalStyle = style!;

    finalStyle = style!.copyWith(
      color: variation?.color,
      height: variation?.height,
      fontWeight: variation?.fontWeight,
      overflow: variation?.overflow,
      fontSize: variation?.fontSize,
    );

    return Text(
      data,
      style: finalStyle,
      textAlign: align,
      overflow: overflowClip ? TextOverflow.clip : null,
      maxLines: overflowClip ? 1 : null,
      softWrap: true,
    );
  }
}
