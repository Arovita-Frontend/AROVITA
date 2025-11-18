import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';

class ConsultButton extends StatelessWidget {
  final bool isMobile;

  const ConsultButton({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 335 : double.infinity,
      height: Responsive.buttonHeight + 4,
      decoration: BoxDecoration(
        color: const Color(0xFF7C3AED),
        borderRadius: BorderRadius.circular(8),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.videocam,
            color: Colors.white,
            size: isMobile ? 22 : 18,
          ),

          const SizedBox(width: 12),

          Text(
            "Start Tele-Consultation",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: Responsive.desktopText16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}