import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Person'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Chat messages container
          Expanded(
            child: ListView(
              children: const [

              ],
            ),
          ),
          // Send message UI
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Handle sending the message here
                    String message = _messageController.text;
                    // Do something with the message (e.g., send it)
                    _messageController.clear(); // Clear the text field after sending
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

