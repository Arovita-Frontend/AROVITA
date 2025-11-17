import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';
import 'screens/appointments/appointment_page.dart';
import 'screens/chat/chat_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/activity/activity_page.dart';
import 'utils/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Initialize Responsive once with screen dimensions
        Responsive.init(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/home': (_) => const HomePage(),
            '/appointments': (_) => const AppointmentPage(),
            '/chat': (_) => const ChatPage(),
            '/profile': (_) => const ProfilePage(),
            '/activity': (_) => const ActivityPage(),
          },
          initialRoute: '/home',
        );
      },
    );
  }
}