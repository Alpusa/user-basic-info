import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.navy,
        onSecondary: Colors.white,
        error: const Color(0xFFB00020),
        onError: Colors.white,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightOnSurface,
        tertiary: AppColors.navyContainer,
        onTertiary: Colors.white,
        primaryContainer: AppColors.lightContainer,
        onPrimaryContainer: AppColors.lightOnSurface,
        secondaryContainer: AppColors.navyContainer,
        onSecondaryContainer: Colors.white,
        surfaceContainerHighest: AppColors.lightContainer,
      ),
      scaffoldBackgroundColor: AppColors.lightSurface,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightContainer,
        hintStyle: const TextStyle(color: AppColors.lightBorder),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightContainer),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.lightSurface,
        foregroundColor: AppColors.lightOnSurface,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        selectedItemColor: AppColors.primary,
  unselectedItemColor: AppColors.lightOnSurface.withAlpha((0.6 * 255).round()),
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
    return base;
  }

  static ThemeData get dark {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.navy,
        onSecondary: Colors.white,
        error: const Color(0xFFCF6679),
        onError: Colors.black,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkOnSurface,
        tertiary: AppColors.navyContainer,
        onTertiary: AppColors.darkOnSurface,
        primaryContainer: AppColors.navyContainer,
        onPrimaryContainer: AppColors.darkOnSurface,
        secondaryContainer: AppColors.navyContainer,
        onSecondaryContainer: AppColors.darkOnSurface,
        surfaceContainerHighest: AppColors.darkContainer,
      ),
      scaffoldBackgroundColor: AppColors.darkSurface,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkContainer,
        hintStyle: const TextStyle(color: AppColors.darkBorder),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkContainer),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkOnSurface,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.navyContainer,
        selectedItemColor: AppColors.darkOnSurface,
        unselectedItemColor: AppColors.darkBorder,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          disabledBackgroundColor: const Color(0xFF2A3A32),
        ),
      ),
    );
    return base;
  }
}
