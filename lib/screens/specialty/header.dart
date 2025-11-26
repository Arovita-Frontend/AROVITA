import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 600;
    double responsivePadding = Responsive.isDesktop ? 50 : 15;
    double heightResponsive = Responsive.isDesktop ? 8 : 2;
    final titleSize = isMobile ? 20.0 : 24.0;
    final subtitleSize = isMobile ? 13.0 : 14.0;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: responsivePadding,
      ),
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          // ========= TOP ROW =========
          SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left section
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF7B5CFA),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),

                    // Show "Back" text only on desktop/tablet
                    if (!isMobile)
                      const Text(
                        "Back",
                        style: TextStyle(
                          color: Color(0xFF7B5CFA),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),

                // Right icon (notification bell)
                IconButton(
                  onPressed: () {},
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.notifications_none),
                      Positioned(
                        right: 0,
                        top: -2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: heightResponsive),

          // ========= TITLE + SUBTITLE =========
          Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: subtitleSize,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ========= SEARCH BAR =========
          Align(
            alignment: isMobile ? Alignment.centerLeft : Alignment.center,
            child: SizedBox(
              width: isMobile ? double.infinity : 400,
              child: _buildSearchBar(context),
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // UPDATED Search bar widget (Figma exact)
  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[700]),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search specialty...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
