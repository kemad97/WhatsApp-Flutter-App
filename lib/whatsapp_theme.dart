import 'package:flutter/material.dart';

const Color kWhatsAppPrimary = Color(0xFF09B549);
const Color kWhatsAppAccent  = Color(0xff7ed879);
const Color kWhatsBackgroundDark = Color(0xff0A1014);


final ThemeData lightWhatsAppTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kWhatsAppPrimary,
  colorScheme: ColorScheme.light(
    primary: kWhatsAppPrimary,
    secondary: kWhatsAppAccent,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black87, // green icons/text
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
  appBarTheme: const AppBarTheme(
    backgroundColor: kWhatsBackgroundDark,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
  ),
  scaffoldBackgroundColor: Colors.grey[900]!, // Darker background for dark mode
  cardColor: Colors.grey[600]!, // Darker background for received messages
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[600], // Dark input background


  ),
);