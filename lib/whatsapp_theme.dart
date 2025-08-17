import 'package:flutter/material.dart';

const Color kWhatsAppPrimary = Color(0xFF128C7E);
const Color kWhatsAppAccent  = Color(0xFF25D366);

final ThemeData lightWhatsAppTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kWhatsAppPrimary,
  colorScheme: ColorScheme.light(
    primary: kWhatsAppPrimary,
    secondary: kWhatsAppAccent,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kWhatsAppPrimary,
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkWhatsAppTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kWhatsAppPrimary,
  colorScheme: ColorScheme.dark(
    primary: kWhatsAppPrimary,
    secondary: kWhatsAppAccent,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kWhatsAppPrimary,
    foregroundColor: Colors.white,
  ),
);
