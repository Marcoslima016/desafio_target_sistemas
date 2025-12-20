import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension DesignSystemExtension on BuildContext {
  DesignSystem get theme => ServiceLocator.I.get<DesignSystem>();
}

class DesignSystem {
  static DesignSystem get I => GetIt.I.get<DesignSystem>();

  final colors = const ColorsTokens();

  final textStyles = TextStylesTokens();
}
