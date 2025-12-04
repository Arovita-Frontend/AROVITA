import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final VoidCallback onShare;

  const Header({
    super.key,
    required this.title,
    required this.onBack,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: onBack,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: onShare,
        ),
      ],
    );
  }
}