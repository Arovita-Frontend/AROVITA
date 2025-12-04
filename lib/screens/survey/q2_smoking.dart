import 'package:flutter/material.dart';
import 'survey_state.dart';

class Q2Smoking extends StatefulWidget {
  final SurveyState state;
  const Q2Smoking({super.key, required this.state});

  @override
  State<Q2Smoking> createState() => _Q2SmokingState();
}

class _Q2SmokingState extends State<Q2Smoking> {
  String selected = "";

  final List<String> options = ["Yes", "No", "Occasionally"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const Text(
            "Tell us about your lifestyle",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),
          Text(
            "This helps us personalize your vitals and stress analysis.",
            style: TextStyle(color: Color(0xFF4C4C4C), fontSize: 14),
          ),

          const SizedBox(height: 24),

          /// Question label
          const Text(
            "Do you smoke?",
            style: TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          /// Inline options (Yes / No / Occasionally)
          Row(
            children: options.map((opt) {
              final bool isSelected = selected == opt;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = opt;
                      widget.state.smoking = opt;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF2E4D2E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF1D422C)
                            : Colors.grey.shade400,
                      ),
                    ),
                    child: Text(
                      opt,
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
