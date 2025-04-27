import 'package:flutter/material.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Service"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ChatBubble(
            message: "Hello, good morning.",
            time: "10:41 pm",
            isMe: false,
          ),
          _ChatBubble(
            message: "I am a Customer Service, is there anything I can help you with?",
            time: "10:41 pm",
            isMe: false,
          ),
          _ChatBubble(
            message: "Hi, I'm having problems with my order & payment.",
            time: "10:50 pm",
            isMe: true,
          ),
          _ChatBubble(
            message: "Can you help me?",
            time: "10:50 pm",
            isMe: true,
          ),
          _ChatBubble(
            message: "Of course...",
            time: "10:51 pm",
            isMe: false,
          ),
          _ChatBubble(
            message: "Can you tell me the problem you are having? so I can help solve it",
            time: "10:51 pm",
            isMe: false,
          ),
        ],
      ),
      bottomNavigationBar: _MessageInputField(),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;

  const _ChatBubble({required this.message, required this.time, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isMe ? Colors.black : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            time,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image_outlined),
            ),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Write your message...",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic),
            ),
          ],
        ),
      ),
    );
  }
}
