import 'package:flutter/material.dart';
import '../../../../models/activity_data.dart';
import 'activity_card.dart';
import '../../../../utils/responsive.dart';

class DailyActivitySummary extends StatefulWidget {
  const DailyActivitySummary({super.key});

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
  State<DailyActivitySummary> createState() => _DailyActivitySummaryState();
}

class _DailyActivitySummaryState extends State<DailyActivitySummary>
    with SingleTickerProviderStateMixin {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
            color: const Color(0xFF1E293B),
          ),
        ),

        const SizedBox(height: 16),

        // EXPANDABLE WHITE CONTAINER
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Container(
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
                // 3 ACTIVITY CARDS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ActivityCard(
                        data: DailyActivitySummary._activityData[0],
                        screenWidth: screenWidth,
                        showProgress: showProgress,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ActivityCard(
                        data: DailyActivitySummary._activityData[1],
                        screenWidth: screenWidth,
                        showProgress: showProgress,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ActivityCard(
                        data: DailyActivitySummary._activityData[2],
                        screenWidth: screenWidth,
                        showProgress: showProgress,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // VIEW MORE / VIEW LESS
                GestureDetector(
                  onTap: () {
                    setState(() => expanded = !expanded);
                  },
                  child: Text(
                    expanded ? "View Less" : "View More",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: Responsive.desktopText14,
                      color: Colors.purple.shade600,
                    ),
                  ),
                ),

                // EXTRA CONTENT WHEN EXPANDED
                if (expanded) ...[
                  const SizedBox(height: 20),

                  // Sample content 
                  Text(
                    "More detailed activity insights will appear here...",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: Responsive.desktopText14,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
