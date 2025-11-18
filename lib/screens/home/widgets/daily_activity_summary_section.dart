import 'package:flutter/material.dart';
import '../../../models/activity_data.dart';
import './activity_card.dart';
import '../../../utils/responsive.dart';

class DailyActivitySummary extends StatelessWidget {
  const DailyActivitySummary({super.key});

  // Array of data to be displayed in the cards.
  static const List<ActivityData> _activityData = [
    ActivityData(
      value: "8,432",
      label: "Steps",
      icon: Icons.directions_walk,
      iconColor: Color(0xFF10B981), 
      progress: 0.75,
    ),
    ActivityData(
      value: "7.5h",
      label: "Sleep",
      icon: Icons.nightlight_round,
      iconColor: Color(0xFF7C3AED), 
      progress: 0.82,
    ),
    ActivityData(
      value: "425",
      label: "Calories",
      icon: Icons.local_fire_department,
      iconColor: Color(0xFFF97316),
      progress: 0.60,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // This controls the progress bar visibility (hides below 840px)
    final showProgress = screenWidth >= 840.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading
        Text(
          "Daily activity summary",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            fontSize: Responsive.desktopText18,
            height: 28 / 18,
            color: Color(0xFF1E293B),
          ),
        ),

        const SizedBox(height: 16),

        // Card Container
        Container(
          width: screenWidth,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Card 1
                  Expanded(
                    child: ActivityCard(
                      data: _activityData[0],
                      screenWidth: screenWidth, 
                      showProgress: showProgress,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Card 2
                  Expanded(
                    child: ActivityCard(
                      data: _activityData[1],
                      screenWidth: screenWidth, 
                      showProgress: showProgress,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Card 3
                  Expanded(
                    child: ActivityCard(
                      data: _activityData[2],
                      screenWidth: screenWidth, 
                      showProgress: showProgress,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // View More Text
              Text(
                "View More",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: Responsive.desktopText14,
                  color: Colors.purple.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}