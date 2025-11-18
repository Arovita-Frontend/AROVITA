import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';

class DoctorCategoryCard extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isMobile;

  const DoctorCategoryCard({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 81 : 120,
      height: isMobile ? 38 : null,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 8 : 12,
        horizontal: isMobile ? 12 : 0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
        boxShadow: [
          if (!isMobile)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 2,
            ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Show icon only on desktop
          if (!isMobile) ...[
            Image.asset(iconPath, height: 28),
            const SizedBox(height: 8),
          ],

          Text(
            label,
            style: TextStyle(
              fontSize: Responsive.desktopText14,
              fontWeight: isMobile ? FontWeight.w400 : FontWeight.w500,
              color: const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }
}