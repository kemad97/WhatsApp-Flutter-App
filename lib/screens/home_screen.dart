
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final chatList = List.generate(10, (index) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/person.jpg'),
          radius: 24,
        ),
        title: Text(
          'Contact $index',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: const Text('message........'),
        trailing: const Text('10:30 AM'),
        onTap: () {

          Navigator.pushNamed(context, ChatScreen.id);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: const [
          Icon(Icons.camera_alt_outlined),
          SizedBox(width: 16),
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8),
        children: chatList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // new chat

        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
