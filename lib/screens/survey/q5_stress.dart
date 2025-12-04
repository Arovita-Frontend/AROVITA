import 'package:flutter/material.dart';
import 'survey_state.dart';

class Q5Stress extends StatefulWidget {
  final SurveyState state;
  const Q5Stress({super.key, required this.state});

  @override
  State<Q5Stress> createState() => _Q5StressState();
}

class _Q5StressState extends State<Q5Stress> {
  int selectedLevel = 0; // 1–5

  // Emoji list (1 = calm, 5 = very stressed)
  final List<String> emojis = [
    "😌", // calm
    "🙂",
    "😐",
    "😟",
    "😰", // very stressed
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive size
        double circleSize = constraints.maxWidth * 0.15;
        if (circleSize > 70) circleSize = 70; // Max size
        if (circleSize < 50) circleSize = 50; // Min size

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

              const Text(
                "How stressed do you feel most days?",
                style: TextStyle(color: Color(0xFF1E293B), fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 20),

              // -------- LABELS ---------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Calm",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Very Stressed",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // -------- EMOJI BUTTONS ---------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(emojis.length, (index) {
                  final int level = index + 1;
                  final bool isSelected = selectedLevel == level;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLevel = level;
                        widget.state.stress = level.toString(); // store 1–5
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? const Color(0xFF2E4D2E)
                            : Colors.white,
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF2E4D2E)
                              : Colors.grey.shade300,
                          width: isSelected ? 3 : 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          emojis[index],
                          style: TextStyle(
                            fontSize: isSelected
                                ? 30
                                : 28,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
