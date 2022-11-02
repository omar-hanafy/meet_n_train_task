import 'package:flutter/material.dart';

import '../../src.dart';

abstract class UITheme {
  static const _fontFamily = "Poppins";
  static const ColorScheme _defaultColorScheme = ColorScheme(
    brightness: Brightness.light,
    surface: UIColors.primaryColor,
    onSurface: UIColors.onPrimaryColor,
    error: UIColors.error,
    onError: UIColors.onError,
    background: UIColors.background,
    onBackground: UIColors.onBackground,
    primary: UIColors.primaryColor,
    onPrimary: UIColors.onPrimaryColor,
    secondary: UIColors.primaryColor,
    onSecondary: UIColors.onPrimaryColor,
  );

  static ThemeData get lightTheme => ThemeData(
        toggleableActiveColor: UIColors.primaryColor,
        fontFamily: _fontFamily,
        colorScheme: _defaultColorScheme,
      );

  static ThemeData get darkTheme => ThemeData(
        toggleableActiveColor: UIColors.primaryColor,
        fontFamily: _fontFamily,
        colorScheme: _defaultColorScheme.copyWith(
          brightness: Brightness.light,
        ),
      );
}
