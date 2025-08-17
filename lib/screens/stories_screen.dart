import 'package:flutter/material.dart';
import 'package:whatsapp/whatsapp_theme.dart';

class Story {
  final String name;
  final String time;

  Story({required this.name, required this.time});
}

class StoriesScreen extends StatelessWidget {
   StoriesScreen({super.key});

  static const String id = 'stories_screen';

  final List<Story> stories = [
    Story(name: 'Kerolos', time: 'Today, 09:15'),
    Story(name: 'Sara',  time: 'Today, 11:50'),
    Story(name: 'Ali', time: 'Yesterday, 19:05'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Status')),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(radius: 26, child: Icon(Icons.person) ,backgroundColor: Colors.grey,),
            title: const Text('My Status'),
            subtitle: const Text('Tap to add status update'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Recent updates',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          ...stories.map(
                (story) => ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kWhatsAppPrimary,
                    width: 3.0,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 26,
                  child: Text(story.name[0]),
                ),
              ),
              title: Text(story.name),
              subtitle: Text(story.time),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

