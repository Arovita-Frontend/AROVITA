import 'package:flutter/material.dart';
import '../../../models/health_tip.dart';

class HealthTipCard extends StatelessWidget {
  final HealthTip tip;
  final double width;

  const HealthTipCard({
    super.key,
    required this.tip,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: tip.gradient,
        borderRadius: BorderRadius.circular(12),

        // Box Shadow
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              tip.icon,
              color: tip.iconColor,
              size: 30,
            ),
          ),

          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  tip.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                // Subtitle
                Text(
                  tip.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 8),

                // Read More
                const Text(
                  "Read More",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7C3AED),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}