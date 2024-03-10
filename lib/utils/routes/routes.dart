import 'package:flutter/material.dart';
import 'package:localloud/views/home_screen.dart';
import 'package:localloud/views/screens/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
    return null;
  }
}

class RouteNames {
  static const String splash = 'splash';
  static const String home = 'home';
}
