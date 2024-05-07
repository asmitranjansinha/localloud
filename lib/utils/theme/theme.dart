import 'package:flutter/material.dart';

class AppTheme {
  final localloudTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            60.0,
          ),
        ),
      ),
    ),
  );

  ThemeData get light => localloudTheme.copyWith(
        scaffoldBackgroundColor: AppColors.lightBackground,
        appBarTheme: const AppBarTheme(
          color: AppColors.lightBackground,
        ),

        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.lightBackground,
          showDragHandle: true,
        ),
        // text related theme
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: AppColors.yellow,
            letterSpacing: 3,
          ),
          headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: AppColors.yellow,
            letterSpacing: 3,
          ),
          headlineSmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.yellow,
            letterSpacing: 3,
          ),
          bodySmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          displaySmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          displayMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          displayLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          titleSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          titleMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          titleLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          labelSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          labelMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
          labelLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.dark,
            letterSpacing: 2,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.lightBackground,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.dark,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          color: AppColors.lightBackground,
        ),
      );

  ThemeData get dark => localloudTheme.copyWith(
        scaffoldBackgroundColor: AppColors.darkBackground,
        appBarTheme: const AppBarTheme(
          color: AppColors.darkBackground,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.darkBackground,
          showDragHandle: true,
        ),

        // text related theme
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: AppColors.yellow,
            letterSpacing: 3,
          ),
          headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: AppColors.yellow,
            letterSpacing: 3,
          ),
          headlineSmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.yellow,
            letterSpacing: 3,
          ),
          bodySmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          displaySmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          displayMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          displayLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          titleSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          titleMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          titleLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          labelSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          labelMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
          labelLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.light,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          color: AppColors.dark,
          textStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
            letterSpacing: 2,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBackground,
        ),
      );
}

class AppColors {
  static const lightBackground = Color(0XffE5E4E2);
  static const darkBackground = Color(0Xff1A1A1A);
  static const primary = Color(0XffFF5733);
  static const dark = Colors.black;
  static const lessDark = Color(0xFF333333);
  static const slightDark = Color(0xFF1A1A1A);
  static const light = Colors.white;
  static const yellow = Color(0xFFFFD700);
  static const slightYellow = Color(0xFFFFE4B5);
  static const translucent = Color(0x99FFFFFF);
  static const lightGrey = Color(0xFFD3D3D3);
  static const red = Color(0xFFDC143C);
  static const slightRed = Color(0xFFE9967A);
  static const green = Color(0xFF228B22);
}
