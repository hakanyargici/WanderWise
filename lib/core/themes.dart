import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  String get logoAsset =>
      _isDark ? 'assets/logo/logo-orange.png' : 'assets/logo/logo-darkblue.png';
}

const colors = {
  "primary": Color(0xFFFF7043),
  "onPrimary": Color(0xFFFFFFFF),
  "secondary": Color(0xFFFFF3E0),
  "onSecondary": Color(0xFF012169),
  "surface": Color(0xFFFFFFFF),
  "onSurface": Color(0xFF012169),
  "success": Colors.green,
  "error": Colors.red,
  "onError": Colors.white,
};

const darkColors = {
  "primary": Color(0xFF012169),
  "onPrimary": Color(0xFFFFF3E0),
  "secondary": Color(0xFF81D4FA),
  "onSecondary": Color(0xFFFFFFFF),
  "surface": Color.fromARGB(255, 0, 9, 29),
  "onSurface": Color(0xFFFFFFFF),
  "success": Colors.green,
  "error": Colors.red,
  "onError": Colors.white,
};

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: colors["primary"]!,
    onPrimary: colors["onPrimary"]!,
    secondary: colors["secondary"]!,
    onSecondary: colors["onSecondary"]!,
    error: colors["error"]!,
    onError: colors["onError"]!,
    surface: colors["surface"]!,
    onSurface: colors["onSurface"]!,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.openSans(),
    bodyMedium: GoogleFonts.openSans(),
    bodyLarge: GoogleFonts.openSans(),
    labelSmall: GoogleFonts.openSans(),
    labelMedium: GoogleFonts.openSans(),
    labelLarge: GoogleFonts.openSans(),
    titleSmall: GoogleFonts.openSans(),
    titleMedium: GoogleFonts.openSans(),
    titleLarge: GoogleFonts.openSans(),
    headlineSmall: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    headlineLarge: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    displayMedium: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    displayLarge: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: darkColors["primary"]!,
    onPrimary: darkColors["onPrimary"]!,
    secondary: darkColors["secondary"]!,
    onSecondary: darkColors["onSecondary"]!,
    error: darkColors["error"]!,
    onError: darkColors["onError"]!,
    surface: darkColors["surface"]!,
    onSurface: darkColors["onSurface"]!,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.openSans(),
    bodyMedium: GoogleFonts.openSans(),
    bodyLarge: GoogleFonts.openSans(),
    labelSmall: GoogleFonts.openSans(),
    labelMedium: GoogleFonts.openSans(),
    labelLarge: GoogleFonts.openSans(),
    titleSmall: GoogleFonts.openSans(),
    titleMedium: GoogleFonts.openSans(),
    titleLarge: GoogleFonts.openSans(),
    headlineSmall: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    headlineLarge: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    displayMedium: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
    displayLarge: GoogleFonts.ubuntu(fontWeight: FontWeight.w700),
  ),
);
