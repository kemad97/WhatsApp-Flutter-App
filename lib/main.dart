import 'package:flutter/material.dart';
import 'package:whatsapp/screens/main_screen.dart';
import 'package:whatsapp/whatsapp_theme.dart';

void main() {
  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: lightWhatsAppTheme,
      darkTheme: darkWhatsAppTheme,
      themeMode: ThemeMode.system,
      home: const MainScreen(),
    );
  }
}
