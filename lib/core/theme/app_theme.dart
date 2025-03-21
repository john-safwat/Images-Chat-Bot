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
