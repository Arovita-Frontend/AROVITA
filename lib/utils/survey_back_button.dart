import 'package:flutter/material.dart';

class SurveyBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final double size;

  const SurveyBackButton({
    super.key,
    required this.onTap,
    this.color = const Color(0xFF2E4D2E),
    this.icon = Icons.arrow_back, // default back icon
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}