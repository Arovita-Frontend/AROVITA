import 'package:flutter/material.dart';
import 'survey_card.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenWidth > 500 ? 420 : screenWidth * 0.9,
            child: const SurveyCard(),
          ),
        ),
      ),
    );
  }
}
