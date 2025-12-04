import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';

class LifestyleCard extends StatefulWidget {
  const LifestyleCard({super.key});

  @override
  State<LifestyleCard> createState() => _LifestyleCardState();
}

class _LifestyleCardState extends State<LifestyleCard> {
  // State for the form
  int activeOptionIndex = -1; // 0..3 for activity options
  String smokeOption = 'No';
  String drinkOption = 'Never';
  double sleepHours = 7.0;
  int stressIndex = 2; // 0..4
  double cardHeight = 1268;
  final activityOptions = const [
    {'title': 'Sedentary', 'desc': 'Little or no exercise'},
    {'title': 'Light Active', 'desc': 'Light activity 1-3 days/week'},
    {'title': 'Moderately Active', 'desc': 'Exercise 3-5 days/week'},
    {'title': 'Very Active', 'desc': 'Hard exercise, physical job'},
  ];

  final smokeOptions = ['No', 'Occasionally', 'Yes'];
  final drinkOptions = ['Never', 'Occasionally', 'Regularly'];
  final stressEmojis = ['😌', '🙂', '😐', '😟', '😫']; // calm -> very stressed

  @override
  Widget build(BuildContext context) {
    // Max card width
    const double maxCardWidth = 672.0;

    final headingStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: Responsive.desktopText24,
      height: 32 / 24,
      color: Color(0xFF1E293B),
    );
    final subheadingStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: Responsive.desktopText14,
      height: 20 / 14,
      color: Color(0xFF64748B),
    );
    final sectionTitleStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: Responsive.desktopText16,
      height: 1.0,
      color: Color(0xFF1E293B),
    );
    final optionDescStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: Responsive.desktopText14,
      height: 1.0,
      color: Color(0xFF64748B),
    );
    final pillTextStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: Responsive.desktopText14,
      color: Colors.black,
    );

    return Center(
      child: Container(
        // Constrain card width for larger screens
        constraints: BoxConstraints(maxWidth: maxCardWidth),
        // Use padding with unscaled values
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Material(
          elevation: 0,
          color: Colors.transparent,
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1) Heading
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Tell us a bit about your lifestyle.',
                      style: headingStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'This helps us personalize your vitals and stress analysis.',
                      style: subheadingStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              // 2) Activity Section (4 options)
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('How active are you in a typical day?',
                        style: sectionTitleStyle),
                    SizedBox(height: 12),
                    Column(
                      children: List.generate(activityOptions.length, (i) {
                        final isSelected = activeOptionIndex == i;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeOptionIndex = i;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 78,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: isSelected
                                      ? Color(0xFF7C3AED)
                                      : Color(0xFFE2E8F0),
                                  width: 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: isSelected ? 6 : 0,
                                    offset: Offset(0, 1))
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Icon box
                                  Container(
                                    width: 25,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Color(0x807C3AED),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.directions_run,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  // Texts
                                  SizedBox(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          activityOptions[i]['title']!,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: Responsive.desktopText16,
                                            color: Color(0xFF1E293B),
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          activityOptions[i]['desc']!,
                                          style: optionDescStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // 3) Smoking question (3 pill options)
              _buildPillOptionsSection(
                  title: 'Do you smoke?',
                  options: smokeOptions,
                  selected: smokeOption,
                  onSelect: (v) => setState(() => smokeOption = v),
                  titleStyle: sectionTitleStyle,
                  pillTextStyle: pillTextStyle),

              SizedBox(height: 16),

              // 4) Alcohol question
              _buildPillOptionsSection(
                  title: 'How often do you drink alcohol?',
                  options: drinkOptions,
                  selected: drinkOption,
                  onSelect: (v) => setState(() => drinkOption = v),
                  titleStyle: sectionTitleStyle,
                  pillTextStyle: pillTextStyle),

              SizedBox(height: 16),

              // 5) Sleep slider
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Average sleep per night', style: sectionTitleStyle),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFE2E8F0), width: 1),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          // 0hr --- value --- 12hr
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0hr', style: subheadingStyle),
                              Text('${sleepHours.round()} hrs',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFF7C3AED),
                                  )),
                              Text('12hrs', style: subheadingStyle),
                            ],
                          ),
                          SizedBox(height: 8),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10),
                            ),
                            child: Slider(
                              min: 0,
                              max: 12,
                              value: sleepHours,
                              onChanged: (v) =>
                                  setState(() => sleepHours = v),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 16),

              // 6) Stress radio-like emoji dots
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('How stressed do you feel most days?',
                        style: sectionTitleStyle),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFE2E8F0), width: 1),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          // Calm --- Very stressed labels
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Calm',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF64748B))),
                              Text('Very stressed',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF64748B))),
                            ],
                          ),
                          SizedBox(height: 12),
                          // emoji dots row, evenly spread
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(stressEmojis.length, (i) {
                                final selected = stressIndex == i;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      stressIndex = i;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? Color(0xFF7C3AED)
                                              : Color(0xFFE2E8F0),
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          stressEmojis[i],
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 7) Save and Continue button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: Opacity(
                  opacity: 1.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/medical_background');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7C3AED),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: Text(
                      'Save and continue',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),

              // 8) Skip for now (cursor pointer)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/medical_background');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Skip for now',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              // 9) small helper text
              Text(
                'You can update these anytime in Settings.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF9CA3AF),
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget builder for pill options (smoke/alcohol)
  Widget _buildPillOptionsSection({
    required String title,
    required List<String> options,
    required String selected,
    required void Function(String) onSelect,
    required TextStyle titleStyle,
    required TextStyle pillTextStyle,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: options.map((o) {
                final isSelected = o == selected;
                return GestureDetector(
                  onTap: () => onSelect(o),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFF7C3AED) : Colors.white,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Color(0xFFE2E8F0), width: 1),
                    ),
                    child: Text(
                      o,
                      style: pillTextStyle.copyWith(
                        color: isSelected ? Colors.white : pillTextStyle.color,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}