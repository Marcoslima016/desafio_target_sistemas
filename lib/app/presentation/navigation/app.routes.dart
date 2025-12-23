import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';

class RoutePage {
  Widget Function() builder;
  String tag;
  RoutePage({
    required this.builder,
    required this.tag,
  });
}

class AppRoutes {
  static List<RoutePage> pages = [
    RoutePage(
      builder: () => Container(),
      tag: '/',
    ),
    RoutePage(
      builder: () => ManageRecordsPage(),
      tag: 'manage_records',
    ),
  ];

  static Route generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => _buildScreen(settings),
    );
  }

  static Widget _buildScreen(RouteSettings settings) {
    for (RoutePage page in pages) {
      if (settings.name == page.tag) {
        return page.builder();
      }
    }
    throw ("Rota ${settings.name} não encontrada. Verifique se a rota foi definida em AppRoutes()");
  }
}
