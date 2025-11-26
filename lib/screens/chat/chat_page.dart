import 'package:flutter/material.dart';
import '../../core/widgets/bottom_nav_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Center(
        child: Text(
          "Chat Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}
