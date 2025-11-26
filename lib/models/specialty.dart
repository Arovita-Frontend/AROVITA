import 'package:flutter/material.dart';

class Specialty {
  final String title;
  final String subtitle; 
  final String? mobileSubtitle;
  final IconData iconData;
  final bool comingSoon;
  final String? lastVisitText;

  Specialty({
    required this.title,
    required this.subtitle,
    this.mobileSubtitle,
    required this.iconData,
    this.comingSoon = false,
    this.lastVisitText,
  });
}
