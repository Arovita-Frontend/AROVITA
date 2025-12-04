import 'package:flutter/material.dart';
import '../../../../utils/responsive.dart';

class ComingSoonSection extends StatelessWidget {
  const ComingSoonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final iconSize = width < 500 ? 28.0 : 34.0;
    final buttonHeight = Responsive.buttonHeight + 4;
    final buttonWidth = width < 500 ? 140.0 : 160.0;

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E8FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.hourglass_empty,
            size: iconSize,
            color: const Color(0xFF7C3AED),
          ),
          const SizedBox(height: 16),

          Text(
            "Coming Soon",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              fontSize: Responsive.desktopText18,
              height: 1.0,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            "We’re adding something exciting. Stay tuned!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              fontSize: Responsive.desktopText14,
              height: 1.0,
              color: const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF7C3AED), width: 2),
            ),
            child: Center(
              child: Text(
                "Notify Me",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: Responsive.desktopText16,
                  color: const Color(0xFF7C3AED),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}