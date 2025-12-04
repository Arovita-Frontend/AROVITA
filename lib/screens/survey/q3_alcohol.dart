import 'package:flutter/material.dart';
import 'survey_state.dart';

class Q3Alcohol extends StatefulWidget {
  final SurveyState state;
  const Q3Alcohol({super.key, required this.state});

  @override
  State<Q3Alcohol> createState() => _Q3AlcoholState();
}

class _Q3AlcoholState extends State<Q3Alcohol> {
  String selected = "";

  final List<String> options = [
    "Never",
    "Regularly",
    "Occasionally",
  ];

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
            "How often do you drink alcohol?",
            style: TextStyle(color: Color(0xFF1E293B), fontSize: 16, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 24),

          /// Inline options (Never / Regularly / Occasionally)
          Row(
            children: options.map((opt) {
              final bool isSelected = selected == opt;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = opt;
                      widget.state.alcohol = opt;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF2E4D2E) : Colors.white,
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
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
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
