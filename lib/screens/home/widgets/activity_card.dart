import 'package:flutter/material.dart';
import '../../../models/activity_data.dart';

class ActivityCard extends StatelessWidget {
  final ActivityData data;
  final double screenWidth;
  final bool showProgress;

  const ActivityCard({
    super.key,
    required this.data,
    required this.screenWidth,
    required this.showProgress,
  });

  @override
  Widget build(BuildContext context) {
    // Determine responsive sizes based on screen width
    final isSmallScreen = screenWidth < 500;
    
    // Responsive Icon and Text Sizing
    final iconSize = isSmallScreen ? 32.0 : 40.0;
    final progressHeight = isSmallScreen ? 6.0 : 8.0;
    final valueFontSize = isSmallScreen ? 18.0 : 22.0;
    final labelFontSize = isSmallScreen ? 12.0 : 14.0;
    final iconRadius = iconSize / 1.4;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: iconRadius,
            backgroundColor: data.iconColor.withOpacity(0.12),
            child: Icon(data.icon, size: iconSize, color: data.iconColor),
          ),

          const SizedBox(height: 12),

          // Value
          Text(
            data.value,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: valueFontSize,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),

          // Label
          Text(
            data.label,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: labelFontSize,
              color: const Color(0xFF64748B),
            ),
          ),

          const SizedBox(height: 12),

          // Progress bar (Conditionally rendered based on showProgress)
          // Since the progress bar needs to take full width and the parent is centered, 
          // we constrain it horizontally to the available width.
          if (showProgress)
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: data.progress,
                  backgroundColor: Colors.grey.shade300,
                  color: data.iconColor, // Progress color matches the icon color
                  minHeight: progressHeight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}