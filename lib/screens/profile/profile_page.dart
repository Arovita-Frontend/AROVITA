import 'package:flutter/material.dart';
import '../../core/widgets/bottom_nav_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Text(
          "Profile Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 4),
    );
  }
}
