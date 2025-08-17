import 'package:flutter/material.dart';

class Message{
  final String text;
  final bool isSender;
  final DateTime time;
  
  Message({required this.text, required this.isSender, required this.time} );
}


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const id = "chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  final List<Message> _messages = [
    Message(text: 'Hey! 👋', isSender: false, time: DateTime.now()),
    Message(text: 'Hello!', isSender: true, time: DateTime.now()),
    Message(text: 'Are you free this evening?', isSender: false, time: DateTime.now()),
    Message(text: 'Yes! Let’s meet at 7.', isSender: true, time: DateTime.now()),
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
  }

  @override
  void dispose() {
    _controller.dispose();
    _sendController.dispose();
    super.dispose();
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
            ? const Color(0xFF004E35)
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(msg.text ,style: TextStyle(color: Colors.white),),
    );

    return Align(
      alignment: msg.isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: bubble,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Column(
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
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ScaleTransition(
                  scale: _sendAnimation,
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _handleSend,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}