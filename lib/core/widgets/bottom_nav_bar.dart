import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double scale = width < 360 ? 0.75 :
                   width < 420 ? 0.85 :
                   width < 500 ? 0.95 : 1.0;

    return Container(
      height: 73,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// HOME (index 0)
          _buildNavItem(
            context,
            index: 0,
            icon: Icons.home_outlined,
            label: "Home",
            scale: scale,
          ),

          /// DOCTOR (index 1)
          _buildNavItem(
            context,
            index: 1,
            icon: Icons.medical_services_outlined,
            label: "Doctors",
            scale: scale,
          ),

          /// APPOINTMENTS (now index 2)
          _buildNavItem(
            context,
            index: 2,
            icon: Icons.calendar_today_outlined,
            label: "Appointments",
            scale: scale,
          ),

          /// CHAT remains index 3
          _buildChatItem(context, scale),

          /// PROFILE (index 4)
          _buildNavItem(
            context,
            index: 4,
            icon: Icons.person_outline,
            label: "Profile",
            scale: scale,
          ),

          /// ACTIVITY (index 5)
          _buildNavItem(
            context,
            index: 5,
            icon: Icons.show_chart_outlined,
            label: "Activity",
            scale: scale,
          ),
        ],
      ),
    );
  }

  // Normal nav item
  Widget _buildNavItem(
  BuildContext context, {
    required int index,
    required IconData icon,
    required String label,
    required double scale,
}) {
  final bool isActive = currentIndex == index;

  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () => _navigate(context, index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28 * scale,
            color: isActive ? Color(0xFF7C3AED) : Color(0xFF64748B),
          ),
          SizedBox(height: 4 * scale),
          Text(
            label,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 12 * scale,
              fontWeight: FontWeight.w500,
              color: isActive ? Color(0xFF7C3AED) : Color(0xFF64748B),
            ),
          ),
        ],
      ),
    ),
  );
}

  // Chat
  Widget _buildChatItem(BuildContext context, double scale) {
  final bool isActive = currentIndex == 3;

  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () => _navigate(context, 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.chat_bubble_outline,
                size: 28 * scale,
                color: isActive ? Color(0xFF7C3AED) : Color(0xFF64748B),
              ),
              Positioned(
                right: -6 * scale,
                top: -2 * scale,
                child: Container(
                  width: 16 * scale,
                  height: 16 * scale,
                  decoration: const BoxDecoration(
                    color: Color(0xFF16A34A),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10 * scale,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4 * scale),
          Text(
            "Chat",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 12 * scale,
              fontWeight: FontWeight.w500,
              color: isActive ? Color(0xFF7C3AED) : Color(0xFF64748B),
            ),
          ),
        ],
      ),
    ),
  );
}

  // Navigation logic
  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;

      case 1:
        Navigator.pushReplacementNamed(context, '/choose_doctor');
        break;

      case 2:
        Navigator.pushReplacementNamed(context, '/appointments');
        break;

      case 3:
        Navigator.pushReplacementNamed(context, '/chat');
        break;

      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;

      case 5:
        Navigator.pushReplacementNamed(context, '/activity');
        break;
    }
  }
}
