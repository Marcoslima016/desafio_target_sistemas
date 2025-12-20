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
      builder: () => LoginPage(),
      tag: 'login',
    ),
  ];

  static Route generateRoute(RouteSettings settings) {
    final screen = _getScreen(settings);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => screen,
    );
  }

  static Widget _getScreen(RouteSettings settings) {
    for (RoutePage page in pages) {
      if (settings.name == page.tag) {
        return page.builder();
      }
    }
    throw ("Rota ${settings.name} não encontrada. A rota para a página foi definida em AppRoutes?");
  }
}
