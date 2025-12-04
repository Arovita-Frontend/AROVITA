import 'package:flutter/material.dart';
import 'survey_state.dart';
import 'q1_activity.dart';
import 'q2_smoking.dart';
import 'q3_alcohol.dart';
import 'q4_sleep.dart';
import 'q5_stress.dart';
import '../../utils/survey_next_button.dart';
import '../../utils/survey_back_button.dart';

class SurveyCard extends StatefulWidget {
  const SurveyCard({super.key});

  @override
  State<SurveyCard> createState() => _SurveyCardState();
}

class _SurveyCardState extends State<SurveyCard> {
  final PageController _pageController = PageController();
  final SurveyState state = SurveyState();
  int currentPage = 0;

  final int totalPages = 5;

  void nextPage() {
    if (currentPage < totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              // ---------- AROVITA LOGO AT TOP ----------
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Image.asset(
                    "assets/images/ArovitaLOGO.png",
                    width: 84,
                    height: 36,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // -------- PROGRESS BAR ----------
              Row(
                children: List.generate(
                  totalPages,
                  (index) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 5,
                      decoration: BoxDecoration(
                        color: index <= currentPage
                            ? const Color(0xFF2E4D2E)
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ---------- SKIP FOR FIRST PAGE ONLY ----------
              if (currentPage == 0) ...[
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/home");
                      },
                      child: const Text(
                        "Skip for now",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],

              // ---------- QUESTION AREA ----------
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (i) => setState(() => currentPage = i),
                  children: [
                    _buildScrollableQuestion(Q1Activity(state: state)),
                    _buildScrollableQuestion(Q2Smoking(state: state)),
                    _buildScrollableQuestion(Q3Alcohol(state: state)),
                    _buildScrollableQuestion(Q4Sleep(state: state)),
                    _buildScrollableQuestion(Q5Stress(state: state)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ---------- NAVIGATION SECTION ----------
              currentPage == totalPages - 1
                  ? SizedBox(
                      width: double.infinity,
                      height: 49, // ← Exact button height
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E4D2E),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          "Save and Continue",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentPage > 0
                            ? SurveyBackButton(
                                onTap: () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 350),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              )
                            : const SizedBox(width: 50),

                        SurveyNextButton(onTap: nextPage),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  /// Wraps each question widget in a scroll view that activates only if needed
  Widget _buildScrollableQuestion(Widget child) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: child,
          ),
        );
      },
    );
  }
}
