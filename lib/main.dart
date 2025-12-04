import 'package:flutter/material.dart';
import 'screens/home/homepage/home_page.dart';
import 'screens/home/appointments/appointment_page.dart';
import 'screens/home/chat/chat_page.dart';
import 'screens/home/profile/profile_page.dart';
import 'screens/home/activity/activity_page.dart';
import 'utils/responsive.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/otp/otp_screen.dart';
import 'screens/personalize/personalize_card.dart';
import 'screens/medical_background/medical_background_screen.dart';
import 'screens/survey/survey_page.dart';
import 'screens/emergency_contacts/emergency_contacts_page.dart';
import 'screens/home/doctor/specialty/select_specialty_page.dart';
import 'screens/home/doctor/choose_doctor/choose_doctor_page.dart';
import 'screens/home/doctor/doctor_details/doctor_details_page.dart';
import 'screens/login/sign_up/sign_up_page.dart';

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
            '/sign_up': (_) => const SignUpPage(),

            '/login': (_) => const LoginScreen(),

            // OTP screen receives phone/email as argument
            '/otp': (context) {
              final args = ModalRoute.of(context)!.settings.arguments as String;
              return OtpScreen(phoneOrEmail: args);
            },

            '/personalize': (_) => const PersonalizeCard(),

            '/survey': (_) => const SurveyPage(),

            '/medical_background': (_) => const MedicalBackgroundScreen(),

            '/emergency_contacts': (_) => const EmergencyContactsScreen(),

            '/choose_doctor': (_) => const ChooseDoctorPage(),

            '/doctor_details': (_) => const DoctorDetailsPage(),

            // Main navigation screens
            '/home': (_) => const HomePage(),
            '/appointments': (_) => const AppointmentPage(),
            '/chat': (_) => const ChatPage(),
            '/profile': (_) => const ProfilePage(),
            '/activity': (_) => const ActivityPage(),

            '/specialty': (_) => const SelectSpecialtyPage(),
          },

          // App starts here by default
          // initialRoute: '/login',
          initialRoute: '/survey',
          // initialRoute: '/doctor_details',
        );
      },
    );
  }
}