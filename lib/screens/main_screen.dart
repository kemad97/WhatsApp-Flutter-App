import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'stories_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return StoriesScreen();
      default:
        return const SizedBox(); // empty for other tabs
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: isDark ? Colors.grey[400] : Colors.grey[600],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 8.0,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(
            icon: const Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.groups),
            label: 'Communities',
          ),
          BottomNavigationBarItem(icon: const Icon(Icons.call), label: 'Calls'),
        ],
      ),
    );
  }
}
