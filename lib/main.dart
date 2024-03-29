import 'package:flutter/material.dart';
import 'package:localloud/controller/theme_controller.dart';
import 'package:localloud/utils/constants/app_constants.dart';
import 'package:localloud/utils/routes/routes.dart';
import 'package:localloud/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
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
