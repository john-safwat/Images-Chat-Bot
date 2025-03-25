import 'package:chat_bot/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Brightness brightness;

  AppTheme(this.primary, this.secondary, this.tertiary, this.brightness);

  late ThemeData theme = ThemeData(
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: secondary,
      secondary: secondary,
      onSecondary: tertiary,
      error: AppColors.red,
      onError: AppColors.white,
      surface: secondary,
      onSurface: primary,
    ),
    textTheme: TextTheme(
      bodySmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: AppColors.gray,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        color: AppColors.gray,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: primary,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: primary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: primary,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        side: BorderSide(
          color: primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16,
      ),
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    )),
    filledButtonTheme: FilledButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}

AppTheme darkTheme = AppTheme(
  AppColors.white,
  AppColors.black,
  AppColors.gray,
  Brightness.dark,
);
AppTheme lightTheme = AppTheme(
  AppColors.blue,
  AppColors.white,
  AppColors.gray,
  Brightness.light,
);
