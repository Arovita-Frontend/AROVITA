import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';

class FloatingMessageButton extends StatelessWidget {
  final int unreadCount;
  final VoidCallback onTap;

  const FloatingMessageButton({
    super.key,
    required this.unreadCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final double buttonSize = Responsive.floatingButtonSize;
    final double iconSize = Responsive.floatingIconSize;
    final double badgeSize = Responsive.floatingBadgeSize;
    final double badgeFont = Responsive.floatingBadgeFont;

    return Positioned(
      bottom: 20,
      right: 20,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            color: const Color(0xFF7C3AED),
            borderRadius: BorderRadius.circular(9999),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, 10),
                blurRadius: 15,
              ),
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Icon(
                  Icons.question_answer_rounded,
                  color: Colors.white,
                  size: iconSize,
                ),
              ),

              if (unreadCount > 0)
                Positioned(
                  top: -badgeSize * 0.33,
                  right: -badgeSize * 0.33,
                  child: Container(
                    width: badgeSize,
                    height: badgeSize,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDC2626),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Center(
                      child: Text(
                        unreadCount > 9 ? "9+" : unreadCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: badgeFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
