import 'package:flutter/material.dart';

class AppSection extends StatelessWidget {
  final Widget child;

  const AppSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Responsive horizontal padding
    double horizontalPadding;

    if (width > 1400) {
      horizontalPadding = 40;
    } else if (width > 900) {
      horizontalPadding = 24;
    } else if (width > 600) {
      horizontalPadding = 20;
    } else {
      horizontalPadding = 16;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 17, // consistent vertical spacing
      ),
      child: child,
    );
  }
}
