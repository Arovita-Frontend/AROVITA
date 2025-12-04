import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double scaleFactor = 1;
    if (screenWidth < 400) {
      scaleFactor = 0.8;
    } else if (screenWidth < 600) {
      scaleFactor = 0.9;
    }

    return Container(
      height: 80 * scaleFactor,
      color: const Color(0xFFF5F3FF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT
          SizedBox(
            width: 213.3 * scaleFactor,
            height: 48 * scaleFactor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 28 * scaleFactor,
                  child: Text(
                    "Good Morning, Sarah",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 20 * scaleFactor,
                      height: 28 / 20,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20 * scaleFactor,
                  child: Text(
                    "Here's your health overview today.",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 14 * scaleFactor,
                      height: 20 / 14,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // RIGHT
          SizedBox(
            width: 73.5 * scaleFactor,
            height: 40 * scaleFactor,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 6 * scaleFactor,
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 24 * scaleFactor,
                    color: Colors.black87,
                  ),
                ),

                // Red dot
                Positioned(
                  top: -8 * scaleFactor,
                  left: 5.5 * scaleFactor,
                  child: Container(
                    width: 20 * scaleFactor,
                    height: 20 * scaleFactor,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDC2626),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "3",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 12 * scaleFactor,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Profile
                Positioned(
                  left: 33.5 * scaleFactor,
                  child: Container(
                    width: 40 * scaleFactor,
                    height: 40 * scaleFactor,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
