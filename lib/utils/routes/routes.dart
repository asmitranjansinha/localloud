import 'package:flutter/material.dart';
import 'package:localloud/views/home_screen.dart';
import 'package:localloud/views/screens/splash_screen.dart';

import '../../views/login_view.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return animatedRouteBuilder(const SplashScreen());

      case RouteNames.home:
        return animatedRouteBuilder(const HomeScreen());

      case RouteNames.login:
        return animatedRouteBuilder(LoginView());
    }
    return null;
  }
}

class RouteNames {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String login = 'login';
}

animatedRouteBuilder(childRoute) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => childRoute,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
