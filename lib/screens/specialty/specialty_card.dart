import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';
import '../../models/specialty.dart';

class SpecialtyCard extends StatelessWidget {
  final Specialty specialty;
  final bool isSelected;
  final VoidCallback onTap;

  const SpecialtyCard({
    super.key,
    required this.specialty,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Base card widget
        final base = Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? const Color(0xFF7C3AED) : Colors.grey.shade200,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // icon
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    specialty.iconData,
                    size: 28,
                    color: const Color(0xFF7C3AED),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                specialty.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Responsive.desktopText16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                MediaQuery.of(context).size.width < 600
                    ? (specialty.mobileSubtitle ?? specialty.subtitle)
                    : specialty.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: Responsive.desktopText14,
                  height: 20 / 14,
                  color: const Color(0xFF64748B),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );

        // Normal card → clickable
        if (!specialty.comingSoon) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onTap,
              child: base,
            ),
          );
        }

        // Coming soon overlay
        return SizedBox.expand(
          child: Stack(
            children: [
              Positioned.fill(child: Opacity(opacity: 0.45, child: base)),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 239, 230, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Coming Soon',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C3AED),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}