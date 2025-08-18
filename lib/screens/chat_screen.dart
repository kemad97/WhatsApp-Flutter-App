import 'package:flutter/material.dart';
import 'package:whatsapp/themes/whatsapp_theme.dart';

import '../models/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const id = "chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false; // Flag to track text input

  final List<Message> _messages = [
    Message(text: 'Hey! ', isSender: false, time: DateTime.now()),
    Message(text: 'Hello!', isSender: true, time: DateTime.now()),
    Message(
      text: 'Are you free this evening?',
      isSender: false,
      time: DateTime.now(),
    ),
    Message(
      text: 'Yes! Let’s meet at 7.',
      isSender: true,
      time: DateTime.now(),
    ),
  ];

  late AnimationController _sendController;
  late Animation<double> _sendAnimation;

  @override
  void initState() {
    super.initState();
    _sendController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _sendAnimation = Tween(begin: 1.0, end: 0.7).animate(_sendController);
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _sendController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.trim().isNotEmpty;
    });
  }

  void _handleSend() {
    if (_controller.text.trim().isEmpty) return;

    _sendController.forward().then((_) => _sendController.reverse());

    setState(() {
      _messages.add(
        Message(
          text: _controller.text.trim(),
          isSender: true,
          time: DateTime.now(),
        ),
      );
      _controller.clear();
    });
  }

  Widget _buildMessageBubble(Message msg) {
    final bubble = Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: msg.isSender ? 60 : 12,
        right: msg.isSender ? 12 : 60,
      ),
      decoration: BoxDecoration(
        color: msg.isSender
            ? const Color(0xFFE1FFC7)
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(msg.text, style: const TextStyle(color: Colors.black)),
    );

    return Align(
      alignment: msg.isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: bubble,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact',
          style: TextStyle(
            color: isDarkMode ? Colors.white : kWhatsBackgroundDark,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:isDarkMode? const AssetImage('images/darkBackground.png'):const AssetImage('images/whatsapp_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(_messages[index]);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                      
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.emoji_emotions_outlined),
                            onPressed: () {
                              // TODO: Implement attachment functionality
                            },
                          ),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                hintText: 'Type a message',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.attach_file),
                            onPressed: () {
                              // TODO: Implement attachment functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                              // TODO: Implement camera functionality
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  _hasText
                      ? ScaleTransition(
                          scale: _sendAnimation,
                          child: IconButton(
                            icon: const Icon(Icons.send, color: Colors.white),
                            onPressed: _handleSend,
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                kWhatsAppPrimary,
                              ),
                              shape: WidgetStateProperty.all(
                                const CircleBorder(),
                              ),
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                            ),
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.mic, color: Colors.white),
                          onPressed: () {
                            // TODO: Implement voice message functionality
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              kWhatsAppPrimary,
                            ),
                            shape: WidgetStateProperty.all(
                              const CircleBorder(),
                            ),
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
