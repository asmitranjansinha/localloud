import 'package:flutter/material.dart';

class AppTheme {
  final localloudTheme = ThemeData();

  ThemeData get light => localloudTheme.copyWith(
        scaffoldBackgroundColor: AppColors.lightBackground,
        appBarTheme: const AppBarTheme(
          color: AppColors.lightBackground,
        ),
      );

  ThemeData get dark => localloudTheme.copyWith(
        scaffoldBackgroundColor: AppColors.darkBackground,
        appBarTheme: const AppBarTheme(
          color: AppColors.darkBackground,
        ),
      );
}

class AppColors {
  static const lightBackground = Color(0XffE5E4E2);
  static const darkBackground = Color(0Xff36454F);
  static const primary = Color(0XffFF5733);
}
