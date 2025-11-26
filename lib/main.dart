import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';
import 'screens/appointments/appointment_page.dart';
import 'screens/chat/chat_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/activity/activity_page.dart';
import 'utils/responsive.dart';
import 'screens/login/login_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/personalize/personalize_card.dart';
import 'screens/medical_background/medical_background_screen.dart';
import 'screens/lifestyle/lifestyle_page.dart';
import 'screens/emergency_contacts/emergency_contacts_page.dart';
import 'screens/specialty/select_specialty_page.dart';
import 'screens/choose_doctor/choose_doctor_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Initialize responsive utility based on device size
        Responsive.init(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,

          // ===============================
          // APP ROUTING CONFIGURATION
          // Defines all top-level pages of the app
          // ===============================
          routes: {
            '/login': (_) => const LoginScreen(),

            // OTP screen receives phone/email as argument
            '/otp': (context) {
              final args = ModalRoute.of(context)!.settings.arguments as String;
              return OtpScreen(phoneOrEmail: args);
            },

            '/personalize': (_) => const PersonalizeCard(),

            '/lifestyle': (_) => const LifestylePage(),

            '/medical_background': (_) => const MedicalBackgroundScreen(),

            '/emergency_contacts': (_) => const EmergencyContactsScreen(),

            '/choose_doctor': (_) => const ChooseDoctorPage(),

            // Main navigation screens
            '/home': (_) => const HomePage(),
            '/appointments': (_) => const AppointmentPage(),
            '/chat': (_) => const ChatPage(),
            '/profile': (_) => const ProfilePage(),
            '/activity': (_) => const ActivityPage(),

            '/specialty': (_) => const SelectSpecialtyPage(),
          },

          // App starts here by default
          initialRoute: '/login',
        );
      },
    );
  }
}