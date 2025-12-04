import 'package:flutter/material.dart';
import '../../../../utils/responsive.dart';

class FamilyMemberCard extends StatelessWidget {
  final String name;
  final String age;
  final String bp;
  final String hr;
  final String imagePath;
  final VoidCallback onTap;

  const FamilyMemberCard({
    super.key,
    required this.name,
    required this.age,
    required this.bp,
    required this.hr,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: isMobile ? 161.5 : 450,
          height: isMobile ? 170 : 190,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isMobile ? 12 : 8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: isMobile ? 48 : 60,
                height: isMobile ? 48 : 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                  fontSize: Responsive.desktopText16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1E293B),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Age: $age",
                style: TextStyle(
                  fontSize: Responsive.desktopText12,
                  color: const Color(0xFF64748B),
                ),
              ),
              SizedBox(height: isMobile ? 4 : 7),
              Text(
                "BP: $bp",
                style: TextStyle(
                  fontSize: Responsive.desktopText12,
                  color: const Color(0xFF64748B),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 14,
                    color: isMobile
                        ? const Color(0xFF16A34A)
                        : const Color(0xFF64748B),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "$hr BPM",
                    style: TextStyle(
                      fontSize: Responsive.desktopText12,
                      color: isMobile
                          ? const Color(0xFF16A34A)
                          : const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}