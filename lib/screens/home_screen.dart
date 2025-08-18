import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_screen.dart';
import 'package:whatsapp/themes/whatsapp_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    late final chatList = List.generate(20, (index) {
      return ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.person),
        ),
        title: Text(
          'Contact $index',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: const Text('message........'),
        trailing: const Text('10:30 AM'),
        onTap: () {
          Navigator.pushNamed(context, ChatScreen.id);
          print("go to chatscreen");
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? kWhatsBackgroundDark : Colors.white,
        title: Text(
          'WhatsApp',
          style: TextStyle(color: isDarkMode ? Colors.white : kWhatsAppPrimary),
        ),
        actions: [
          Icon(
            Icons.camera_alt_outlined,
            color:
                Theme.of(context).appBarTheme.foregroundColor ??
                (isDarkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(width: 16),
          Icon(
            Icons.more_vert,
            color:
                Theme.of(context).appBarTheme.foregroundColor ??
                (isDarkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ask Meta AI or Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]
                    : Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.5),
                  borderSide: BorderSide.none,
                ),
                isDense: true,
              ),
            ),
          ),

          // Filter chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: true,
                  shape: const StadiumBorder(),
                  selectedColor: kWhatsAppAccent,
                  backgroundColor: isDarkMode
                      ? Colors.grey[850]
                      : Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Unread'),
                  selected: false,
                  shape: const StadiumBorder(),
                  backgroundColor: isDarkMode
                      ? Colors.grey[850]
                      : Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Groups'),
                  selected: false,
                  shape: const StadiumBorder(),
                  backgroundColor: isDarkMode
                      ? Colors.grey[850]
                      : Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Channels'),
                  selected: false,
                  shape: const StadiumBorder(),
                  backgroundColor: isDarkMode
                      ? Colors.grey[850]
                      : Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(width: 14),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Chat list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              children: chatList,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ChatScreen.id);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
