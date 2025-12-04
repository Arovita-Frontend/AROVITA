import 'package:flutter/material.dart';
import '../../../utils/app_section.dart';
import 'widgets/home_header.dart';
import 'widgets/notification_banner.dart';
import 'widgets/heart_rate_card.dart';
import 'widgets/consult_doctor_section.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import 'widgets/family_health_section.dart';
import 'widgets/daily_activity_summary_section.dart';
import 'widgets/coming_soon_section.dart';
import 'widgets/health_tips_section.dart';
import '../../../utils/floating_message_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),

      // Bottom navigation bar shared across main screens
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),

      body: Stack(
        children: [
          // =======================================
          // MAIN SCROLLABLE HOME CONTENT
          // Contains header, banners, cards, sections
          // =======================================
          SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: 16),

                // Each section wrapped inside AppSection for consistent spacing
                AppSection(child: HomeHeader()),
                AppSection(child: NotificationBanner()),
                AppSection(child: HeartRateCard()),
                AppSection(child: ConsultDoctorSection()),
                AppSection(child: FamilyHealthSection()),
                AppSection(child: DailyActivitySummary()),
                AppSection(child: HealthTipsSection()),
                AppSection(child: ComingSoonSection()),

                SizedBox(height: 40),
              ],
            ),
          ),

          // Floating chat/message button above scroll content
          FloatingMessageButton(
            unreadCount: 2,
            onTap: () => Navigator.pushNamed(context, '/chat'),
          ),
        ],
      ),
    );
  }
}
