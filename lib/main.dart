import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_screen.dart';
import 'package:whatsapp/screens/home_screen.dart';
import 'package:whatsapp/screens/main_screen.dart';
import 'package:whatsapp/screens/stories_screen.dart';
import 'package:whatsapp/themes/whatsapp_theme.dart';

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
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        StoriesScreen.id: (context) => StoriesScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
