import 'package:flutter/material.dart';

const Color kWhatsAppPrimary = Color(0xFF09B549);
const Color kWhatsAppAccent  = Color(0xffaaffa8);


final ThemeData lightWhatsAppTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kWhatsAppPrimary,
  colorScheme: ColorScheme.light(
    primary: kWhatsAppPrimary,
    secondary: kWhatsAppAccent,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: kWhatsAppPrimary, // green icons/text
    titleTextStyle: TextStyle(
      color: kWhatsAppPrimary,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
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
