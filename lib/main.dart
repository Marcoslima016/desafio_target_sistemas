import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';

void main() async {
  ServiceLocator.I.setup();
  runApp(const AppWidget());
}
