import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';

class DoctorInfoCard extends StatelessWidget {
  final String name;
  final String field;
  final String imagePath;
  final bool isMobile;
  final double width;

  const DoctorInfoCard({
    super.key,
    required this.name,
    required this.field,
    required this.imagePath,
    required this.isMobile,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: isMobile ? 80 : 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 12 : 8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(imagePath, height: 48, width: 48),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: Responsive.paragraph,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                // Field / specialization
                Text(
                  field,
                  style: TextStyle(
                    fontSize: Responsive.cardParagraph,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),

          // Availability text
          Text(
            isMobile ? "● Available" : "● Available now",
            style: TextStyle(
              color: const Color(0xFF16A34A),
              fontSize: Responsive.cardHeading-1,
            ),
          ),
        ],
      ),
    );
  }
}
