import 'package:flutter/material.dart';
import 'survey_state.dart';

class Q4Sleep extends StatefulWidget {
  final SurveyState state;
  const Q4Sleep({super.key, required this.state});

  @override
  State<Q4Sleep> createState() => _Q4SleepState();
}

class _Q4SleepState extends State<Q4Sleep> {
  double sleepHours = 7; // Default value

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

          const Text(
            "Average sleep per night?",
            style: TextStyle(color: Color(0xFF1E293B), fontSize: 16, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                /// Min & Max labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "0 hrs",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Text(
                      "12 hrs",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 6,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 18,
                    ),
                  ),
                  child: Slider(
                    value: sleepHours,
                    min: 0,
                    max: 12,
                    activeColor: const Color(0xFF2E4D2E),
                    inactiveColor: Colors.grey.shade300,
                    onChanged: (value) {
                      setState(() {
                        sleepHours = value;
                        widget.state.sleep =
                            "${sleepHours.toStringAsFixed(1)} hrs";
                      });
                    },
                  ),
                ),

                const SizedBox(height: 4),

                /// Value display
                Text(
                  "${sleepHours.toStringAsFixed(1)} hrs",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1A73E8), // Blue like screenshot
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
