import 'package:flutter/material.dart';

import '../../core/constant/string.dart';
import '../../core/exceptions/route_exceptions.dart';
import '../screen/counter_screen/counter_screen.dart';


class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const CounterScreen(
            title: Strings.homeScreenTitle,
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}