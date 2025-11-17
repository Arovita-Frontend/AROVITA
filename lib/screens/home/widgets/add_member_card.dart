import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../utils/responsive.dart';

class AddMemberCard extends StatelessWidget {
  const AddMemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use constraints for local responsiveness
        final isMobile = constraints.maxWidth < 600;

        final double cardWidth = isMobile ? 161.5 : 453.3;
        final double cardHeight = isMobile ? 98 : 198;
        final double borderRadius = isMobile ? 12 : 8;
        final double iconSize = isMobile ? 32 : 40;

        return DottedBorder(
          color: const Color(0xFF7C3AED),
          strokeWidth: 2,
          dashPattern: const [4, 3],
          borderType: BorderType.RRect,
          radius: Radius.circular(borderRadius),
          child: Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x11000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: iconSize,
                    color: const Color(0xFF7C3AED),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Add Member",
                    style: TextStyle(
                      fontSize: Responsive.paragraph, // keep centralized text size
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C3AED),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}