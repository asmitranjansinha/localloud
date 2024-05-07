import 'package:flutter/material.dart';
import 'package:localloud/controller/auth_controller.dart';
import 'package:localloud/controller/home_controller.dart';
import 'package:localloud/controller/post_controller.dart';
import 'package:localloud/controller/theme_controller.dart';
import 'package:localloud/utils/constants/app_constants.dart';
import 'package:localloud/utils/routes/routes.dart';
import 'package:localloud/utils/theme/theme.dart';
import 'package:provider/provider.dart';

import 'controller/user_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => PostController()),
      ],
      child: LocalLoud(
        appTheme: AppTheme(),
      ),
    ),
  );
}

class LocalLoud extends StatelessWidget {
  final AppTheme appTheme;
  const LocalLoud({
    super.key,
    required this.appTheme,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return MaterialApp(
      title: AppConstants.appName,
      themeMode: themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: themeController.isDarkMode ? appTheme.dark : appTheme.light,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: RouteNames.splash,
    );
  }
}
