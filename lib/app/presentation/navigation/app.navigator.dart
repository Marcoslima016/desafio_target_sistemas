import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static AppNavigator get I => ServiceLocator.I.get<AppNavigator>();
  final INavigatorAdapter adapter;

  AppNavigator({
    required this.adapter,
  });

  void goToHome({
    required BuildContext context,
  }) {
    navigateToRoute(
      context: context,
      route: 'home',
      behavior: NavigationBehavior.replaceCurrent,
    );
  }

  Future<T?> navigateToRoute<T extends Object?, TO extends Object?>({
    required BuildContext context,
    required String route,
    required NavigationBehavior behavior,
    Object? arguments,
  }) async {
    return await adapter.navigateToRoute(
      context: context,
      route: route,
      behavior: behavior,
    );
  }
}

/// .
/// .
/// .
///
///  ### NAVIGATOR ADAPTER
///
/// Abstração que visa desacoplar abordagens e packages,
/// facilitando mudanças de estratégia no decorrer do projeto.
abstract class INavigatorAdapter {
  Future<T?> navigateToRoute<T extends Object?, TO extends Object?>({
    required BuildContext context,
    required String route,
    required NavigationBehavior behavior,
    Object? arguments,
  });
}

///
/// Adapter que utiliza a implementação nativa.
class NativeNavigator implements INavigatorAdapter {
  @override
  Future<T?> navigateToRoute<T extends Object?, TO extends Object?>({
    required BuildContext context,
    required String route,
    required NavigationBehavior behavior,
    Object? arguments,
  }) async {
    if (behavior.key == NavigationBehaviorKeys.add) {
      return Navigator.of(context).pushNamed<T>(route);
    } else if (behavior.key == NavigationBehaviorKeys.replaceCurrent) {
      return Navigator.of(context).pushReplacementNamed<T, TO>(route);
    } else if (behavior.key == NavigationBehaviorKeys.replaceAll) {
      return Navigator.of(context).pushNamedAndRemoveUntil(
        route,
        (route) => route.settings.name == "/",
      );
    } else if (behavior.key == NavigationBehaviorKeys.replaceUntil) {
      return Navigator.of(context).pushNamedAndRemoveUntil(
        route,
        behavior.predicate!,
      );
    } else {
      throw ("Falha ao navegar.");
    }
  }
}

///  EXEMPLOS

/// Exemplo de outro caso de utilização do adapter (utilizando o package Go Route):
/// class GoRouteNavigator implements INavigatorAdapter {
///   . . .
/// }

/// Exemplo de outro caso de utilização do adapter (utilizando o package RouteFly):
/// class RouteFlyNavigator implements INavigatorAdapter {
///   . . .
/// }

/// MODELS & ENUMS

/// TODO: Refatorar (Mover p/ camada domain)

enum NavigationBehaviorKeys {
  replaceAll,
  replaceCurrent,
  add,
  replaceUntil,
}

class NavigationBehavior {
  final bool Function(dynamic)? predicate;
  final NavigationBehaviorKeys key;

  const NavigationBehavior._({
    required this.predicate,
    required this.key,
  });

  static const NavigationBehavior replaceAll = NavigationBehavior._(
    key: NavigationBehaviorKeys.replaceAll,
    predicate: null,
  );

  static const NavigationBehavior replaceCurrent = NavigationBehavior._(
    key: NavigationBehaviorKeys.replaceCurrent,
    predicate: null,
  );

  static const NavigationBehavior add = NavigationBehavior._(
    key: NavigationBehaviorKeys.add,
    predicate: null,
  );

  static NavigationBehavior replaceUntil({
    required bool Function(dynamic)? predicate,
  }) {
    return NavigationBehavior._(
      key: NavigationBehaviorKeys.replaceUntil,
      predicate: predicate,
    );
  }
}
