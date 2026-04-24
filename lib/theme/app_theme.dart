import 'package:flutter/material.dart';
import 'package:my_app/theme/app_colors.dart';
import 'package:my_app/theme/app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ColorScheme _colorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.primary,
      onSecondary: AppColors.onPrimary,
      error: Colors.red,
      onError: Colors.white,
      surface:
          brightness == Brightness.light
              ? AppColors.lightSurface
              : AppColors.darkSurface,
      onSurface:
          brightness == Brightness.light
              ? AppColors.lightOnSurface
              : AppColors.darkOnSurface,
    );
  }

  static dynamic _elementTypes(ColorScheme colorScheme) {
    return (
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        centerTitle: false,
      ),

      dividerColor: colorScheme.outline,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colorScheme.primary),
          foregroundColor: WidgetStateProperty.all(colorScheme.onPrimary),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    final colorSchemes = _colorScheme(Brightness.light);
    final lightElementThemes = _elementTypes(colorSchemes);

    return ThemeData(
      useMaterial3: true,
      fontFamily: "ShantellSans",
      scaffoldBackgroundColor: colorSchemes.surface,
      textTheme: const TextTheme(bodyMedium: AppTextStyles.bodyMedium),
      colorScheme: colorSchemes,
      appBarTheme: lightElementThemes.appBarTheme,
      dividerColor: lightElementThemes.dividerColor,
      elevatedButtonTheme: lightElementThemes.elevatedButtonTheme,
    );
  }
}
