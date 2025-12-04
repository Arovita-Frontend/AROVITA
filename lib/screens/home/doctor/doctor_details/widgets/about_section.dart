import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final String about;

  const AboutSection({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        about,
        style: const TextStyle(fontSize: 13, color: Colors.black87),
      ),
    );
  }
}
