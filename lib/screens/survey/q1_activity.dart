import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'survey_state.dart';

class Q1Activity extends StatefulWidget {
  final SurveyState state;
  const Q1Activity({super.key, required this.state});

  @override
  State<Q1Activity> createState() => _Q1ActivityState();
}

class _Q1ActivityState extends State<Q1Activity> {
  String? selected;

  final accent = const Color(0xFF2E4D2E); // primary accent from screenshot

  final List<Map<String, String>> options = [
    {
      "label": "Sedentary (little or no exercise)",
      "asset": "assets/images/sedentary.png",
    },
    {
      "label": "Lightly Active (light activity 1–3 days/week)",
      "asset": "assets/images/lightly_active.png",
    },
    {
      "label": "Moderately Active (exercise 3–5 days/week)",
      "asset": "assets/images/moderately_active.png",
    },
    {
      "label": "Very Active (hard exercise or physical job)",
      "asset": "assets/images/very_active.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return _buildQ1UI();
  }

  Widget _buildQ1UI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          // ---- MAIN TITLE ----
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Tell us about your lifestyle",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // ---- DESCRIPTION TEXT ----
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "This helps us personalize your vitals and stress analysis.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4C4C4C),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ---- SUBTITLE ----
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "How active are you in a typical day?",
              style: TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ---- OPTIONS LIST ----
          ...options.map((opt) {
            final isSelected = selected == opt["label"];
            return _buildOptionTile(opt, isSelected);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildOptionTile(Map<String, String> opt, bool isSelected) {
    final accent = const Color(0xFF2E4D2E);

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = opt["label"];
          widget.state.activityLevel = opt["label"];
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? accent : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // ---- LEFT ICON IMAGE ----
            Image.asset(
              opt["asset"]!,
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),

            const SizedBox(width: 16),

            // ---- OPTION TEXT ----
            Expanded(
              child: Text(
                opt["label"]!,
                style: TextStyle(
                  fontSize: Responsive.desktopText14,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // ---- SELECTED CHECKMARK ----
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isSelected ? accent : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? accent : Colors.grey,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
