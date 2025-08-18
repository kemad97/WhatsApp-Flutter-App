import 'package:flutter/material.dart';
import 'package:whatsapp/themes/whatsapp_theme.dart';
import 'package:whatsapp/models/story.dart';

class StoryViewScreen extends StatefulWidget {
  final Story story;

  const StoryViewScreen({super.key, required this.story});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _nextStory();
        }
      });
    _startProgress();
  }

  void _startProgress() {
    _progressController.forward(from: 0.0);
  }

  void _nextStory() {
    if (_currentIndex < widget.story.media.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _startProgress();
    } else {
      Navigator.pop(context);
    }
  }

  void _previousStory() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _startProgress();
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) {
          final screenWidth = MediaQuery.of(context).size.width;
          final tapPosition = details.localPosition.dx;

          if (tapPosition < screenWidth / 2) {
            _previousStory(); // Tap on the left half
          } else {
            _nextStory(); // Tap on the right half
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.story.media[_currentIndex],
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text('Image failed to load', style: TextStyle(color: Colors.white)));
              },
            ),
            Positioned(
              top: 60,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.story.name,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_currentIndex + 1}/${widget.story.media.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 100,
              left: 16,
              right: 16,
              child: Row(
                children: List.generate(widget.story.media.length, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: LinearProgressIndicator(
                        value: _currentIndex == index ? _progressController.value : (_currentIndex > index ? 1.0 : 0.0),
                        backgroundColor: Colors.grey[600],
                        valueColor: AlwaysStoppedAnimation<Color>(kWhatsAppPrimary),
                        minHeight: 3,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}