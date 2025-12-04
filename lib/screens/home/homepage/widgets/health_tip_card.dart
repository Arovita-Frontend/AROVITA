import 'package:flutter/material.dart';
import '../../../../models/health_tip.dart';
import '../../../../utils/responsive.dart';

class HealthTipCard extends StatefulWidget {
  final HealthTip tip;
  final double width;

  const HealthTipCard({
    super.key,
    required this.tip,
    required this.width,
  });

  @override
  State<HealthTipCard> createState() => _HealthTipCardState();
}

class _HealthTipCardState extends State<HealthTipCard>
    with SingleTickerProviderStateMixin {

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final double collapsedHeight = Responsive.isMobile ? 70 : 102;
    final double responsivePadding = Responsive.isMobile ? 7 : 16;
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,

      child: Container(
        width: widget.width,
        height: expanded ? null : collapsedHeight,  // Dynamic height

        padding: EdgeInsets.all(responsivePadding),
        decoration: BoxDecoration(
          gradient: widget.tip.gradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              offset: Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ICON
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                widget.tip.icon,
                color: widget.tip.iconColor,
                size: Responsive.isMobile ? 24 : 30,
              ),
            ),

            // TEXT SECTION
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TITLE
                  Text(
                    widget.tip.title,
                    style: TextStyle(
                      fontSize: Responsive.desktopText16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // SUBTITLE
                  Text(
                    widget.tip.subtitle,
                    maxLines: expanded ? null : 1,
                    overflow: expanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Responsive.desktopText12,
                      color: Colors.grey.shade800,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // READ MORE / LESS
                  GestureDetector(
                    onTap: () => setState(() => expanded = !expanded),
                    child: Text(
                      expanded ? "Read Less" : "Read More",
                      style: TextStyle(
                        fontSize: Responsive.desktopText12,
                        color: const Color(0xFF7C3AED),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
