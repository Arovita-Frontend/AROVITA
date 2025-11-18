import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/responsive.dart';

class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.maxWidth;
        bool isMobile = w < 600;

        return isMobile ? _mobileLayout() : _desktopLayout(w);
      },
    );
  }

  // DESKTOP LAYOUT
  Widget _desktopLayout(double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Color(0x1A000000), blurRadius: 15, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x1A000000), blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FIRST ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LEFT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Heart Rate",
                    style: TextStyle(
                      fontSize: Responsive.desktopText18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E293B),
                      fontFamily: "Inter",
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "72",
                        style: TextStyle(
                          fontSize: Responsive.desktopText30,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "BPM",
                        style: TextStyle(
                          fontSize: Responsive.desktopText14,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF16A34A),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          "Calm",
                          style: TextStyle(
                            fontSize: Responsive.desktopText12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // RIGHT (empty graph box)
              Container(
                width: 128,
                height: 64,
                color: const Color(0xFFF1F5F9),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // SECOND ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "HRV: 45ms | Stress: Low",
                style: TextStyle(
                  fontSize: Responsive.desktopText14,
                  color: const Color(0xFF64748B),
                ),
              ),
              Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF7C3AED),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Measure now",
                  style: TextStyle(
                    fontSize: Responsive.desktopText16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // MOBILE LAYOUT
  Widget _mobileLayout() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Color(0x1A000000), blurRadius: 15, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x1A000000), blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FIRST ROW: Heart Rate + Calm Tag
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Heart Rate",
                style: TextStyle(
                  fontSize: Responsive.desktopText16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                  fontFamily: "Inter",
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF16A34A),
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Text(
                  "Calm",
                  style: TextStyle(
                    fontSize: Responsive.desktopText12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // SECOND ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "72",
                    style: TextStyle(
                      fontSize: Responsive.desktopText30,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "BPM",
                    style: TextStyle(
                      fontSize: Responsive.desktopText14,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
              // RIGHT GRAPH BOX
              Container(
                width: 96,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(22, 163, 74, 0.2),
                      Color.fromRGBO(22, 163, 74, 0.4),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // THIRD ROW – Button
          SizedBox(
            width: double.infinity,
            height: Responsive.buttonHeight+3,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C3AED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Iconsax.camera, color: Colors.white, size: 20),
              label: Text(
                "Measure now",
                style: TextStyle(
                  fontSize: Responsive.desktopText16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
