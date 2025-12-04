import 'package:flutter/material.dart';
import '../../../../utils/responsive.dart';
import 'doctor_profile_popup.dart';

class DoctorInfoCard extends StatelessWidget {
  final String name;
  final String field;
  final String imagePath;
  final bool isMobile;
  final double width;

  const DoctorInfoCard({
    super.key,
    required this.name,
    required this.field,
    required this.imagePath,
    required this.isMobile,
    required this.width,
  });

  void _showDoctorPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return DoctorProfilePopup(
          name: name,
          field: field,
          imagePath: imagePath,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showDoctorPopup(context),
        child: Container(
          width: width,
          height: isMobile ? 80 : 100,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isMobile ? 12 : 8),
            border: Border.all(color: const Color(0xFFE5E7EB)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(imagePath, height: 48, width: 48),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: Responsive.desktopText16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      field,
                      style: TextStyle(
                        fontSize: Responsive.desktopText14,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                isMobile ? "● Available" : "● Available now",
                style: TextStyle(
                  color: const Color(0xFF16A34A),
                  fontSize: Responsive.desktopText12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}