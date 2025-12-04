import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 500;

    return Container(
      height: isMobile ? 44 : 52,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: const Border(
          left: BorderSide(
            color: Color(0xFF7C3AED),
            width: 4,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        "You have 2 new messages from Dr. Johnson",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: Responsive.desktopText14,
          fontWeight: FontWeight.w400,
          height: 1.0,
          color: Color(0xFF1E293B),
        ),
      ),
    );
  }
}
