import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';

extension DesignSystemExtension on BuildContext {
  DesignSystem get design => ServiceLocator.I.get<DesignSystem>();
}

class DesignSystem {
  static DesignSystem get I => ServiceLocator.I.get<DesignSystem>();

  final colors = const ColorsTokens();

  final textStyles = TextStylesTokens();
}
