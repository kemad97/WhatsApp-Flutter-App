
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_screen.dart';
import 'package:whatsapp/whatsapp_theme.dart';


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
          child: Icon(Icons.person),
          backgroundColor: Colors.blueGrey,
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
          backgroundColor: Colors.white,
          title: const Text(
            'WhatsApp',
            style: TextStyle(color: Color(0xFF1DC262)),
          ),
          actions: [
            Icon(
              Icons.camera_alt_outlined,
              color: isDarkMode ? Colors.white : Colors.black, // Adjust color based on theme
            ),
            const SizedBox(width: 16),
            Icon(
              Icons.more_vert,
              color: isDarkMode ? Colors.white : Colors.black, // Adjust color based on theme
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
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
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
              children: const [
                ChoiceChip(label: Text('All' ), selected: true , shape: StadiumBorder(),selectedColor: kWhatsAppAccent ),
                SizedBox(width: 10)
                ,
                ChoiceChip(label: Text('Unread'), selected: false , shape: StadiumBorder()),
                SizedBox(width: 10),

                ChoiceChip(label: Text('Groups'), selected: false , shape: StadiumBorder()),
                SizedBox(width: 10),
                ChoiceChip(label: Text('Channels'), selected: false , shape: StadiumBorder()),
              ],
            ),
          ),
          const SizedBox(height: 12),

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
