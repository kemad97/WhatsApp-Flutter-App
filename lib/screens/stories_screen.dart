import 'package:flutter/material.dart';
import '../models/story.dart';
import 'story_view_screen.dart';
import 'package:whatsapp/whatsapp_theme.dart';

class StoriesScreen extends StatelessWidget {
  StoriesScreen({super.key});

  static const String id = 'stories_screen';

  final List<Story> stories = [
    Story(name: 'Kerolos', time: 'Today, 09:15'),
    Story(name: 'Sara', time: 'Today, 11:50'),
    Story(name: 'Ali', time: 'Yesterday, 19:05'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Status',
          style: TextStyle(
            color: isDarkMode ? Colors.white : kWhatsAppPrimary,
          ),
        ),
        backgroundColor: isDarkMode ? kWhatsBackgroundDark : Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: isDarkMode ? Colors.white : Colors.black,
            onPressed: () {
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
              child: Icon(
                Icons.add,
                color: isDarkMode ? Colors.white : Colors.black,
                size: 24,
              ),
            ),
            title: const Text('My Status'),
            subtitle: const Text('Tap to add status update'),
            onTap: () {
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Recent updates',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          ...stories.map(
                (story) => ListTile(
              contentPadding:  EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    _createStoryRoute(story),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kWhatsAppPrimary,
                      width: 3.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                    radius: 26,
                    child: Text(
                      story.name[0],
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(story.name, style: TextStyle(fontSize: 16)),
              subtitle: Text(story.time, style: TextStyle(fontSize: 14, color: isDarkMode ? Colors.grey[400] : Colors.grey[600])),
            ),
          ),
        ],
      ),
    );
  }

  // Custom route with slide-up animation
  Route _createStoryRoute(Story story) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => StoryViewScreen(story: story),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}