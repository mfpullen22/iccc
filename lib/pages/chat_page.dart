import "package:flutter/material.dart";

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Chat")),
      body: Center(
        child: Column(
          children: const [
            Text("Live Chat Page"),
          ],
        ),
      ),
    );
  }
}