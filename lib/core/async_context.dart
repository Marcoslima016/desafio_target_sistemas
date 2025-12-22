import 'package:flutter/material.dart';

class AsyncContext {
  late BuildContext? _context;

  set value(BuildContext context) => _context = context;

  AsyncContext({BuildContext? context}) {
    if (context != null) _context = context;
  }

  BuildContext call() {
    if (_context == null) {
      String consoleOutput = "ERROR: CONTEXT IS NULL! Informe o context via método construtor ao instanciar,";
      consoleOutput = consoleOutput += " ou defina posteriormente através do setter 'value(BuildContext context)'";
      throw (consoleOutput);
    }
    if (_context!.mounted == false) throw ("Context not mounted!");
    return _context!;
  }
}
