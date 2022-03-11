import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  ThemeConfig._();
  static ThemeData theme() => ThemeData(
        primaryColor: const Color(0xff5C77CE),
        primaryColorLight: const Color(0xff5C77CE),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff5C77CE),
          ),
        ),
        textTheme: GoogleFonts.mandaliTextTheme(),
      );
}

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  // Color get buttonColor => Theme.of(this).buttonColor.;
  Color get buttonColor => Theme.of(this).buttonTheme.colorScheme!.onBackground;
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get titleStyle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      );
}
