import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';
import 'screens/appointments/appointment_page.dart';
import 'screens/chat/chat_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/activity/activity_page.dart';
import 'utils/responsive.dart';
import 'screens/login/login_screen.dart';
import 'screens/otp/otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Responsive.init(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,

          // ---------- ROUTES ----------
         routes: {
          '/login': (_) => const LoginScreen(),

          // OTP route now expects arguments
          '/otp': (context) {
            final args = ModalRoute.of(context)!.settings.arguments as String;
            return OtpScreen(phoneOrEmail: args);
          },

          '/home': (_) => const HomePage(),
          '/appointments': (_) => const AppointmentPage(),
          '/chat': (_) => const ChatPage(),
          '/profile': (_) => const ProfilePage(),
          '/activity': (_) => const ActivityPage(),
        },

          // App always starts at login page
          initialRoute: '/login',
        );
      },
    );
  }
}