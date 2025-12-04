import 'package:flutter/material.dart';
import '../../../core/widgets/bottom_nav_bar.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity"),
      ),
      body: Center(
        child: Text(
          "Activity Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 5),
    );
  }
}
