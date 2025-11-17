import 'package:flutter/material.dart';

class ActivityData {
  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;
  final double progress; // 0.0 to 1.0

  const ActivityData({
    required this.value,
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.progress,
  });
}